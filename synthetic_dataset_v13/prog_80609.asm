; DESCRIPTION: Composite: Places a green 77x84 rectangle at position (122, 55) then Renders a blue disk with center (388, 121) and radius 78.
; PLAN: r0=122(x), r1=55(y), r2=77(width), r3=84(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=388(x), r6=121(y), r7=78(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 122
LDI r1, 55
LDI r2, 77
LDI r3, 84
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 388
LDI r6, 121
LDI r7, 78
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
