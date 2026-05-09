; DESCRIPTION: Composite: Creates a red rectangular region at (175, 140) spanning 96 by 78 pixels then Renders a orange disk with center (383, 65) and radius 48.
; PLAN: r0=175(x), r1=140(y), r2=96(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=383(x), r6=65(y), r7=48(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 175
LDI r1, 140
LDI r2, 96
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 383
LDI r6, 65
LDI r7, 48
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
