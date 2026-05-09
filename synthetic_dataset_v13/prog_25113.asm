; DESCRIPTION: Composite: Creates a blue circular shape at (390, 106) with radius 74 then Renders a blue box of size 48x28 starting at (431, 83).
; PLAN: r0=390(x), r1=106(y), r2=74(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=431(x), r6=83(y), r7=48(width), r8=28(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 390
LDI r1, 106
LDI r2, 74
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 431
LDI r6, 83
LDI r7, 48
LDI r8, 28
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
