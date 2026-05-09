; DESCRIPTION: Composite: Renders a black line between points (408, 74) and (246, 26) then Draws a white rectangle at (410, 62) with width 52 and height 66 then Draws a black circle centered at (81, 57) with radius 24.
; PLAN: r0=408(x1), r1=74(y1), r2=246(x2), r3=26(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=410(x), r6=62(y), r7=52(width), r8=66(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=81(x), r11=57(y), r12=24(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 408
LDI r1, 74
LDI r2, 246
LDI r3, 26
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 410
LDI r6, 62
LDI r7, 52
LDI r8, 66
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 81
LDI r11, 57
LDI r12, 24
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
