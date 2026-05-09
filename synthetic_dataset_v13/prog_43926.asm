; DESCRIPTION: Composite: Places a yellow line segment connecting (258, 181) to (228, 84) then Sets a single purple pixel at (257, 134).
; PLAN: r0=258(x1), r1=181(y1), r2=228(x2), r3=84(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=257(x), r6=134(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 258
LDI r1, 181
LDI r2, 228
LDI r3, 84
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 257
LDI r6, 134
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
