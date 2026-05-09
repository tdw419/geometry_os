; DESCRIPTION: Composite: Places a green line segment connecting (288, 98) to (359, 71) then Places a magenta dot at position (227, 201).
; PLAN: r0=288(x1), r1=98(y1), r2=359(x2), r3=71(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=227(x), r6=201(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 288
LDI r1, 98
LDI r2, 359
LDI r3, 71
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 227
LDI r6, 201
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
