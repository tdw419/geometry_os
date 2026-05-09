; DESCRIPTION: Composite: Draws a orange rectangle at (418, 45) with width 55 and height 25 then Renders a blue line between points (102, 118) and (341, 184).
; PLAN: r0=418(x), r1=45(y), r2=55(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=102(x1), r6=118(y1), r7=341(x2), r8=184(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 418
LDI r1, 45
LDI r2, 55
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 102
LDI r6, 118
LDI r7, 341
LDI r8, 184
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
