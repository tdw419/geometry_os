; DESCRIPTION: Composite: Places a magenta line segment connecting (318, 37) to (101, 250) then Renders a green box of size 72x119 starting at (140, 41) then Sets a single orange pixel at (139, 237).
; PLAN: r0=318(x1), r1=37(y1), r2=101(x2), r3=250(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=140(x), r6=41(y), r7=72(width), r8=119(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=139(x), r11=237(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 318
LDI r1, 37
LDI r2, 101
LDI r3, 250
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 140
LDI r6, 41
LDI r7, 72
LDI r8, 119
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 139
LDI r11, 237
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
