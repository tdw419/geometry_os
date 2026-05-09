; DESCRIPTION: Composite: Renders a orange line between points (359, 145) and (211, 103) then Places a black circle of radius 33 at center (304, 150).
; PLAN: r0=359(x1), r1=145(y1), r2=211(x2), r3=103(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=304(x), r6=150(y), r7=33(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 359
LDI r1, 145
LDI r2, 211
LDI r3, 103
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 304
LDI r6, 150
LDI r7, 33
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
