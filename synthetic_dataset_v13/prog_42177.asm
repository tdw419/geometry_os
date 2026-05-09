; DESCRIPTION: Composite: Renders a purple disk with center (86, 74) and radius 31 then Creates a magenta rectangular region at (78, 34) spanning 60 by 107 pixels.
; PLAN: r0=86(x), r1=74(y), r2=31(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=78(x), r6=34(y), r7=60(width), r8=107(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 86
LDI r1, 74
LDI r2, 31
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 78
LDI r6, 34
LDI r7, 60
LDI r8, 107
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
