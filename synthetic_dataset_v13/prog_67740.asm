; DESCRIPTION: Composite: Renders a orange line between points (281, 180) and (61, 242) then Sets a single purple pixel at (265, 88) then Creates a red circular shape at (212, 220) with radius 20.
; PLAN: r0=281(x1), r1=180(y1), r2=61(x2), r3=242(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=265(x), r6=88(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=212(x), r11=220(y), r12=20(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 281
LDI r1, 180
LDI r2, 61
LDI r3, 242
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 265
LDI r6, 88
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 212
LDI r11, 220
LDI r12, 20
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
