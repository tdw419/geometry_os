; DESCRIPTION: Composite: Renders a cyan line between points (62, 37) and (483, 90) then Places a orange dot at position (243, 224) then Renders a green disk with center (312, 159) and radius 69.
; PLAN: r0=62(x1), r1=37(y1), r2=483(x2), r3=90(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=243(x), r6=224(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=312(x), r11=159(y), r12=69(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 62
LDI r1, 37
LDI r2, 483
LDI r3, 90
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 243
LDI r6, 224
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 312
LDI r11, 159
LDI r12, 69
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
