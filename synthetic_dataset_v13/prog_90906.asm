; DESCRIPTION: Composite: Renders a green line between points (157, 24) and (27, 235) then Places a magenta circle of radius 18 at center (144, 205) then Sets a single white pixel at (248, 151).
; PLAN: r0=157(x1), r1=24(y1), r2=27(x2), r3=235(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=144(x), r6=205(y), r7=18(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=248(x), r11=151(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 157
LDI r1, 24
LDI r2, 27
LDI r3, 235
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 144
LDI r6, 205
LDI r7, 18
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 248
LDI r11, 151
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
