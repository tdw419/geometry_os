; DESCRIPTION: Composite: Renders a purple box of size 77x78 starting at (143, 150) then Renders a green disk with center (462, 105) and radius 47.
; PLAN: r0=143(x), r1=150(y), r2=77(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=462(x), r6=105(y), r7=47(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 143
LDI r1, 150
LDI r2, 77
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 462
LDI r6, 105
LDI r7, 47
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
