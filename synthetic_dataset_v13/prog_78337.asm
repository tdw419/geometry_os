; DESCRIPTION: Composite: Draws a cyan line from (309, 86) to (279, 115) then Draws a magenta circle centered at (471, 156) with radius 41.
; PLAN: r0=309(x1), r1=86(y1), r2=279(x2), r3=115(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=471(x), r6=156(y), r7=41(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 309
LDI r1, 86
LDI r2, 279
LDI r3, 115
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 471
LDI r6, 156
LDI r7, 41
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
