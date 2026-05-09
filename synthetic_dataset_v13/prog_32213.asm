; DESCRIPTION: Composite: Draws a green circle centered at (257, 88) with radius 49 then Renders a magenta line between points (143, 236) and (264, 96).
; PLAN: r0=257(x), r1=88(y), r2=49(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=143(x1), r6=236(y1), r7=264(x2), r8=96(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 257
LDI r1, 88
LDI r2, 49
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 143
LDI r6, 236
LDI r7, 264
LDI r8, 96
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
