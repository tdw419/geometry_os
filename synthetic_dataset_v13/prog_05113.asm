; DESCRIPTION: Composite: Draws a black circle centered at (245, 206) with radius 14 then Draws a purple line from (211, 27) to (257, 169).
; PLAN: r0=245(x), r1=206(y), r2=14(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=211(x1), r6=27(y1), r7=257(x2), r8=169(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 245
LDI r1, 206
LDI r2, 14
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 211
LDI r6, 27
LDI r7, 257
LDI r8, 169
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
