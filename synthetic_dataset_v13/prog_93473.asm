; DESCRIPTION: Composite: Renders a orange line between points (3, 79) and (451, 135) then Places a white circle of radius 73 at center (241, 153).
; PLAN: r0=3(x1), r1=79(y1), r2=451(x2), r3=135(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=241(x), r6=153(y), r7=73(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 3
LDI r1, 79
LDI r2, 451
LDI r3, 135
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 241
LDI r6, 153
LDI r7, 73
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
