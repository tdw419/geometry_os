; DESCRIPTION: Composite: Renders a green disk with center (182, 224) and radius 27 then Places a green line segment connecting (505, 37) to (357, 79).
; PLAN: r0=182(x), r1=224(y), r2=27(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=505(x1), r6=37(y1), r7=357(x2), r8=79(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 182
LDI r1, 224
LDI r2, 27
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 505
LDI r6, 37
LDI r7, 357
LDI r8, 79
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
