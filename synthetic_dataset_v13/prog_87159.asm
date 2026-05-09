; DESCRIPTION: Composite: Creates a cyan rectangular region at (240, 94) spanning 119 by 25 pixels then Renders a blue disk with center (40, 183) and radius 39.
; PLAN: r0=240(x), r1=94(y), r2=119(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=40(x), r6=183(y), r7=39(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 240
LDI r1, 94
LDI r2, 119
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 40
LDI r6, 183
LDI r7, 39
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
