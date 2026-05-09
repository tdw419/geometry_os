; DESCRIPTION: Composite: Creates a blue rectangular region at (202, 140) spanning 91 by 107 pixels then Sets a single orange pixel at (413, 115) then Renders a green disk with center (282, 160) and radius 28.
; PLAN: r0=202(x), r1=140(y), r2=91(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=413(x), r6=115(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=282(x), r11=160(y), r12=28(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 202
LDI r1, 140
LDI r2, 91
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 413
LDI r6, 115
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 282
LDI r11, 160
LDI r12, 28
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
