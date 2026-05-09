; DESCRIPTION: Composite: Places a green line segment connecting (307, 143) to (4, 17) then Places a orange dot at position (396, 5).
; PLAN: r0=307(x1), r1=143(y1), r2=4(x2), r3=17(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=396(x), r6=5(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 307
LDI r1, 143
LDI r2, 4
LDI r3, 17
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 396
LDI r6, 5
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
