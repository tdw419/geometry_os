; DESCRIPTION: Composite: Renders a black line between points (179, 50) and (257, 205) then Sets a single cyan pixel at (410, 156) then Creates a green rectangular region at (61, 132) spanning 99 by 37 pixels.
; PLAN: r0=179(x1), r1=50(y1), r2=257(x2), r3=205(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=410(x), r6=156(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=61(x), r11=132(y), r12=99(width), r13=37(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 179
LDI r1, 50
LDI r2, 257
LDI r3, 205
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 410
LDI r6, 156
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 61
LDI r11, 132
LDI r12, 99
LDI r13, 37
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
