; DESCRIPTION: Composite: Renders a orange line between points (448, 63) and (383, 133) then Places a yellow circle of radius 22 at center (244, 48).
; PLAN: r0=448(x1), r1=63(y1), r2=383(x2), r3=133(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=244(x), r6=48(y), r7=22(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 448
LDI r1, 63
LDI r2, 383
LDI r3, 133
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 244
LDI r6, 48
LDI r7, 22
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
