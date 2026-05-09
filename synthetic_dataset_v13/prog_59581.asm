; DESCRIPTION: Composite: Creates a magenta rectangular region at (270, 50) spanning 50 by 11 pixels then Renders a black disk with center (220, 134) and radius 20.
; PLAN: r0=270(x), r1=50(y), r2=50(width), r3=11(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=220(x), r6=134(y), r7=20(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 270
LDI r1, 50
LDI r2, 50
LDI r3, 11
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 220
LDI r6, 134
LDI r7, 20
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
