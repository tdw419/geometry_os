; DESCRIPTION: Composite: Creates a black circular shape at (135, 108) with radius 34 then Draws a blue line from (88, 185) to (349, 230).
; PLAN: r0=135(x), r1=108(y), r2=34(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=88(x1), r6=185(y1), r7=349(x2), r8=230(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 135
LDI r1, 108
LDI r2, 34
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 88
LDI r6, 185
LDI r7, 349
LDI r8, 230
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
