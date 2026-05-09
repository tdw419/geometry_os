; DESCRIPTION: Composite: Creates a cyan rectangular region at (221, 87) spanning 26 by 118 pixels then Renders a black disk with center (426, 145) and radius 64.
; PLAN: r0=221(x), r1=87(y), r2=26(width), r3=118(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=426(x), r6=145(y), r7=64(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 221
LDI r1, 87
LDI r2, 26
LDI r3, 118
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 426
LDI r6, 145
LDI r7, 64
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
