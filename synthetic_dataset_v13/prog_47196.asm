; DESCRIPTION: Composite: Draws a purple circle centered at (398, 51) with radius 43 then Renders a blue line between points (293, 15) and (501, 173).
; PLAN: r0=398(x), r1=51(y), r2=43(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=293(x1), r6=15(y1), r7=501(x2), r8=173(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 398
LDI r1, 51
LDI r2, 43
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 293
LDI r6, 15
LDI r7, 501
LDI r8, 173
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
