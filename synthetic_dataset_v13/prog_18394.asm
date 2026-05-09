; DESCRIPTION: Composite: Places a yellow line segment connecting (164, 27) to (475, 90) then Places a magenta dot at position (496, 156).
; PLAN: r0=164(x1), r1=27(y1), r2=475(x2), r3=90(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=496(x), r6=156(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 164
LDI r1, 27
LDI r2, 475
LDI r3, 90
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 496
LDI r6, 156
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
