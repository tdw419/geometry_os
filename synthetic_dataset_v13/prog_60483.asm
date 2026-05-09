; DESCRIPTION: Composite: Draws a red rectangle at (252, 175) with width 85 and height 59 then Renders a red line between points (120, 207) and (51, 39) then Places a green circle of radius 64 at center (424, 64).
; PLAN: r0=252(x), r1=175(y), r2=85(width), r3=59(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=120(x1), r6=207(y1), r7=51(x2), r8=39(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=424(x), r11=64(y), r12=64(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 252
LDI r1, 175
LDI r2, 85
LDI r3, 59
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 120
LDI r6, 207
LDI r7, 51
LDI r8, 39
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 424
LDI r11, 64
LDI r12, 64
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
