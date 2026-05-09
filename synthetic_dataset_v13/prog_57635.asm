; DESCRIPTION: Composite: Creates a cyan rectangular region at (172, 153) spanning 92 by 52 pixels then Creates a magenta circular shape at (182, 160) with radius 53.
; PLAN: r0=172(x), r1=153(y), r2=92(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=182(x), r6=160(y), r7=53(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 172
LDI r1, 153
LDI r2, 92
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 182
LDI r6, 160
LDI r7, 53
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
