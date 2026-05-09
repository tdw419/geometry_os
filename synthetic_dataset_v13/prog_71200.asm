; DESCRIPTION: Composite: Creates a black circular shape at (212, 139) with radius 51 then Renders a magenta box of size 109x75 starting at (250, 119).
; PLAN: r0=212(x), r1=139(y), r2=51(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=250(x), r6=119(y), r7=109(width), r8=75(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 212
LDI r1, 139
LDI r2, 51
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 250
LDI r6, 119
LDI r7, 109
LDI r8, 75
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
