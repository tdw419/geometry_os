; DESCRIPTION: Composite: Draws a purple line from (345, 156) to (183, 197) then Places a magenta circle of radius 76 at center (223, 128).
; PLAN: r0=345(x1), r1=156(y1), r2=183(x2), r3=197(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=223(x), r6=128(y), r7=76(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 345
LDI r1, 156
LDI r2, 183
LDI r3, 197
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 223
LDI r6, 128
LDI r7, 76
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
