; DESCRIPTION: Composite: Places a green line segment connecting (354, 183) to (432, 98) then Renders a magenta disk with center (245, 110) and radius 55.
; PLAN: r0=354(x1), r1=183(y1), r2=432(x2), r3=98(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=245(x), r6=110(y), r7=55(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 354
LDI r1, 183
LDI r2, 432
LDI r3, 98
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 245
LDI r6, 110
LDI r7, 55
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
