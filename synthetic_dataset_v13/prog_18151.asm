; DESCRIPTION: Composite: Draws a orange line from (500, 149) to (8, 145) then Places a red circle of radius 73 at center (312, 99).
; PLAN: r0=500(x1), r1=149(y1), r2=8(x2), r3=145(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=312(x), r6=99(y), r7=73(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 500
LDI r1, 149
LDI r2, 8
LDI r3, 145
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 312
LDI r6, 99
LDI r7, 73
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
