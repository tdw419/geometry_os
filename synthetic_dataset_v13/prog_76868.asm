; DESCRIPTION: Composite: Creates a magenta rectangular region at (81, 127) spanning 85 by 90 pixels then Creates a cyan circular shape at (106, 100) with radius 53.
; PLAN: r0=81(x), r1=127(y), r2=85(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=106(x), r6=100(y), r7=53(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 81
LDI r1, 127
LDI r2, 85
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 106
LDI r6, 100
LDI r7, 53
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
