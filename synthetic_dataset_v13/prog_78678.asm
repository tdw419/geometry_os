; DESCRIPTION: Composite: Renders a magenta line between points (458, 206) and (257, 86) then Creates a blue circular shape at (402, 207) with radius 18.
; PLAN: r0=458(x1), r1=206(y1), r2=257(x2), r3=86(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=402(x), r6=207(y), r7=18(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 458
LDI r1, 206
LDI r2, 257
LDI r3, 86
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 402
LDI r6, 207
LDI r7, 18
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
