; DESCRIPTION: Composite: Places a magenta line segment connecting (1, 27) to (45, 36) then Places a yellow dot at position (201, 33).
; PLAN: r0=1(x1), r1=27(y1), r2=45(x2), r3=36(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=201(x), r6=33(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 1
LDI r1, 27
LDI r2, 45
LDI r3, 36
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 201
LDI r6, 33
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
