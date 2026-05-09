; DESCRIPTION: Composite: Places a blue 102x101 rectangle at position (399, 75) then Sets a single orange pixel at (417, 246) then Renders a orange line between points (245, 195) and (289, 12).
; PLAN: r0=399(x), r1=75(y), r2=102(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=417(x), r6=246(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=245(x1), r11=195(y1), r12=289(x2), r13=12(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 399
LDI r1, 75
LDI r2, 102
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 417
LDI r6, 246
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 245
LDI r11, 195
LDI r12, 289
LDI r13, 12
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
