; DESCRIPTION: Composite: Sets a single red pixel at (499, 83) then Draws a green rectangle at (382, 196) with width 90 and height 48 then Renders a red line between points (457, 137) and (327, 29).
; PLAN: r0=499(x), r1=83(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=382(x), r6=196(y), r7=90(width), r8=48(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=457(x1), r11=137(y1), r12=327(x2), r13=29(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 499
LDI r1, 83
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 382
LDI r6, 196
LDI r7, 90
LDI r8, 48
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 457
LDI r11, 137
LDI r12, 327
LDI r13, 29
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
