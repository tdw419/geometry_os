; DESCRIPTION: Composite: Creates a red rectangular region at (83, 95) spanning 90 by 62 pixels then Renders a yellow disk with center (193, 140) and radius 79.
; PLAN: r0=83(x), r1=95(y), r2=90(width), r3=62(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=193(x), r6=140(y), r7=79(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 83
LDI r1, 95
LDI r2, 90
LDI r3, 62
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 193
LDI r6, 140
LDI r7, 79
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
