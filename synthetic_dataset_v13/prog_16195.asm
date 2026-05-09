; DESCRIPTION: Composite: Places a green line segment connecting (33, 0) to (493, 224) then Renders a white disk with center (204, 119) and radius 43.
; PLAN: r0=33(x1), r1=0(y1), r2=493(x2), r3=224(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=204(x), r6=119(y), r7=43(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 33
LDI r1, 0
LDI r2, 493
LDI r3, 224
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 204
LDI r6, 119
LDI r7, 43
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
