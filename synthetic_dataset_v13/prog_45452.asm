; DESCRIPTION: Composite: Draws a orange line from (199, 51) to (0, 69) then Places a white circle of radius 12 at center (200, 227).
; PLAN: r0=199(x1), r1=51(y1), r2=0(x2), r3=69(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=200(x), r6=227(y), r7=12(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 199
LDI r1, 51
LDI r2, 0
LDI r3, 69
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 200
LDI r6, 227
LDI r7, 12
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
