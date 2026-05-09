; DESCRIPTION: Composite: Renders a green box of size 107x12 starting at (222, 65) then Renders a yellow disk with center (452, 201) and radius 46.
; PLAN: r0=222(x), r1=65(y), r2=107(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=452(x), r6=201(y), r7=46(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 222
LDI r1, 65
LDI r2, 107
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 452
LDI r6, 201
LDI r7, 46
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
