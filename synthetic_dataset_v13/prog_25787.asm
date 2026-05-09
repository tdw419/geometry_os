; DESCRIPTION: Composite: Places a green line segment connecting (33, 38) to (435, 1) then Renders a yellow disk with center (350, 86) and radius 76.
; PLAN: r0=33(x1), r1=38(y1), r2=435(x2), r3=1(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=350(x), r6=86(y), r7=76(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 33
LDI r1, 38
LDI r2, 435
LDI r3, 1
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 350
LDI r6, 86
LDI r7, 76
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
