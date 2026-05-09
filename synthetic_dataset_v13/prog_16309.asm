; DESCRIPTION: Composite: Places a black line segment connecting (99, 200) to (183, 208) then Places a white dot at position (421, 64).
; PLAN: r0=99(x1), r1=200(y1), r2=183(x2), r3=208(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=421(x), r6=64(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 99
LDI r1, 200
LDI r2, 183
LDI r3, 208
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 421
LDI r6, 64
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
