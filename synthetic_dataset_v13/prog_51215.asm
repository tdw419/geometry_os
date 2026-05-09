; DESCRIPTION: Composite: Creates a cyan rectangular region at (348, 120) spanning 108 by 19 pixels then Renders a blue disk with center (273, 130) and radius 68.
; PLAN: r0=348(x), r1=120(y), r2=108(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=273(x), r6=130(y), r7=68(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 348
LDI r1, 120
LDI r2, 108
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 273
LDI r6, 130
LDI r7, 68
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
