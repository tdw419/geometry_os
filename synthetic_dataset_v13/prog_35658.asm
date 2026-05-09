; DESCRIPTION: Composite: Renders a yellow box of size 64x33 starting at (193, 176) then Renders a white disk with center (468, 119) and radius 22.
; PLAN: r0=193(x), r1=176(y), r2=64(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=468(x), r6=119(y), r7=22(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 193
LDI r1, 176
LDI r2, 64
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 468
LDI r6, 119
LDI r7, 22
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
