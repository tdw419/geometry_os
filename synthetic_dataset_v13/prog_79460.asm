; DESCRIPTION: Composite: Places a green line segment connecting (304, 213) to (389, 235) then Draws a magenta circle centered at (257, 130) with radius 27.
; PLAN: r0=304(x1), r1=213(y1), r2=389(x2), r3=235(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=257(x), r6=130(y), r7=27(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 304
LDI r1, 213
LDI r2, 389
LDI r3, 235
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 257
LDI r6, 130
LDI r7, 27
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
