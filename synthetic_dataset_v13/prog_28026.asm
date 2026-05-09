; DESCRIPTION: Composite: Renders a yellow disk with center (92, 203) and radius 23 then Renders a purple box of size 45x20 starting at (105, 118).
; PLAN: r0=92(x), r1=203(y), r2=23(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=105(x), r6=118(y), r7=45(width), r8=20(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 92
LDI r1, 203
LDI r2, 23
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 105
LDI r6, 118
LDI r7, 45
LDI r8, 20
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
