; DESCRIPTION: Composite: Places a yellow dot at position (418, 54) then Draws a white rectangle at (358, 162) with width 93 and height 20 then Renders a red line between points (359, 135) and (176, 182).
; PLAN: r0=418(x), r1=54(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=358(x), r6=162(y), r7=93(width), r8=20(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=359(x1), r11=135(y1), r12=176(x2), r13=182(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 418
LDI r1, 54
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 358
LDI r6, 162
LDI r7, 93
LDI r8, 20
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 359
LDI r11, 135
LDI r12, 176
LDI r13, 182
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
