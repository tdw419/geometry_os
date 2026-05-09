; DESCRIPTION: Composite: Places a white 69x99 rectangle at position (86, 119) then Renders a green disk with center (99, 78) and radius 75.
; PLAN: r0=86(x), r1=119(y), r2=69(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=99(x), r6=78(y), r7=75(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 86
LDI r1, 119
LDI r2, 69
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 99
LDI r6, 78
LDI r7, 75
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
