; DESCRIPTION: Composite: Places a yellow line segment connecting (421, 37) to (25, 197) then Sets a single cyan pixel at (309, 109).
; PLAN: r0=421(x1), r1=37(y1), r2=25(x2), r3=197(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=309(x), r6=109(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 421
LDI r1, 37
LDI r2, 25
LDI r3, 197
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 309
LDI r6, 109
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
