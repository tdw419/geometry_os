; DESCRIPTION: Composite: Renders a cyan box of size 37x37 starting at (463, 27) then Sets a single blue pixel at (213, 56) then Renders a green disk with center (149, 146) and radius 48.
; PLAN: r0=463(x), r1=27(y), r2=37(width), r3=37(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=213(x), r6=56(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=149(x), r11=146(y), r12=48(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 463
LDI r1, 27
LDI r2, 37
LDI r3, 37
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 213
LDI r6, 56
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 149
LDI r11, 146
LDI r12, 48
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
