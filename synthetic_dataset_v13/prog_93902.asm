; DESCRIPTION: Composite: Renders a orange line between points (360, 63) and (363, 47) then Places a black circle of radius 24 at center (164, 31).
; PLAN: r0=360(x1), r1=63(y1), r2=363(x2), r3=47(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=164(x), r6=31(y), r7=24(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 360
LDI r1, 63
LDI r2, 363
LDI r3, 47
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 164
LDI r6, 31
LDI r7, 24
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
