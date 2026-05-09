; DESCRIPTION: Composite: Renders a green box of size 81x104 starting at (248, 41) then Renders a blue disk with center (91, 140) and radius 17.
; PLAN: r0=248(x), r1=41(y), r2=81(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=91(x), r6=140(y), r7=17(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 248
LDI r1, 41
LDI r2, 81
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 91
LDI r6, 140
LDI r7, 17
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
