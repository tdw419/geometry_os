; DESCRIPTION: Composite: Renders a black box of size 20x13 starting at (211, 52) then Renders a green line between points (410, 91) and (253, 179) then Sets a single magenta pixel at (321, 64).
; PLAN: r0=211(x), r1=52(y), r2=20(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=410(x1), r6=91(y1), r7=253(x2), r8=179(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=321(x), r11=64(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 211
LDI r1, 52
LDI r2, 20
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 410
LDI r6, 91
LDI r7, 253
LDI r8, 179
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 321
LDI r11, 64
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
