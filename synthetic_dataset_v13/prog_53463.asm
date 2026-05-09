; DESCRIPTION: Composite: Renders a cyan line between points (140, 224) and (380, 132) then Sets a single orange pixel at (400, 93) then Renders a yellow disk with center (177, 92) and radius 66.
; PLAN: r0=140(x1), r1=224(y1), r2=380(x2), r3=132(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=400(x), r6=93(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=177(x), r11=92(y), r12=66(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 140
LDI r1, 224
LDI r2, 380
LDI r3, 132
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 400
LDI r6, 93
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 177
LDI r11, 92
LDI r12, 66
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
