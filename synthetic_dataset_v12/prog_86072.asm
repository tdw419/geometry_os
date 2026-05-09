; DESCRIPTION: Composite: Renders a red disk with center (439, 189) and radius 23 then Draws a purple line from (257, 59) to (475, 252).
; PLAN: r0=439(x), r1=189(y), r2=23(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=257(x1), r6=59(y1), r7=475(x2), r8=252(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 439
LDI r1, 189
LDI r2, 23
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 257
LDI r6, 59
LDI r7, 475
LDI r8, 252
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
