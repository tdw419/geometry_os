; DESCRIPTION: Composite: Places a white 17x48 rectangle at position (2, 130) then Renders a blue disk with center (158, 119) and radius 21.
; PLAN: r0=2(x), r1=130(y), r2=17(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=158(x), r6=119(y), r7=21(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 2
LDI r1, 130
LDI r2, 17
LDI r3, 48
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 158
LDI r6, 119
LDI r7, 21
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
