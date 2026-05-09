; DESCRIPTION: Composite: Sets a single purple pixel at (224, 154) then Renders a black line between points (310, 26) and (196, 251) then Creates a red circular shape at (145, 80) with radius 70.
; PLAN: r0=224(x), r1=154(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=310(x1), r6=26(y1), r7=196(x2), r8=251(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=145(x), r11=80(y), r12=70(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 224
LDI r1, 154
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 310
LDI r6, 26
LDI r7, 196
LDI r8, 251
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 145
LDI r11, 80
LDI r12, 70
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
