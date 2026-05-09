; DESCRIPTION: Composite: Places a cyan line segment connecting (355, 241) to (103, 156) then Places a cyan dot at position (257, 94) then Creates a magenta circular shape at (344, 128) with radius 51.
; PLAN: r0=355(x1), r1=241(y1), r2=103(x2), r3=156(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=257(x), r6=94(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=344(x), r11=128(y), r12=51(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 355
LDI r1, 241
LDI r2, 103
LDI r3, 156
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 257
LDI r6, 94
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 344
LDI r11, 128
LDI r12, 51
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
