; DESCRIPTION: Composite: Renders a cyan line between points (0, 3) and (441, 244) then Places a purple circle of radius 25 at center (449, 140).
; PLAN: r0=0(x1), r1=3(y1), r2=441(x2), r3=244(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=449(x), r6=140(y), r7=25(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 0
LDI r1, 3
LDI r2, 441
LDI r3, 244
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 449
LDI r6, 140
LDI r7, 25
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
