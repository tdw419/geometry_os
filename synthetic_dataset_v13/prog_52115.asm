; DESCRIPTION: Composite: Renders a yellow disk with center (247, 158) and radius 61 then Creates a magenta rectangular region at (329, 118) spanning 112 by 28 pixels.
; PLAN: r0=247(x), r1=158(y), r2=61(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=329(x), r6=118(y), r7=112(width), r8=28(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 247
LDI r1, 158
LDI r2, 61
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 329
LDI r6, 118
LDI r7, 112
LDI r8, 28
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
