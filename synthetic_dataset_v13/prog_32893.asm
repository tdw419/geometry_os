; DESCRIPTION: Composite: Creates a magenta rectangular region at (77, 34) spanning 95 by 16 pixels then Places a red circle of radius 28 at center (452, 218).
; PLAN: r0=77(x), r1=34(y), r2=95(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=452(x), r6=218(y), r7=28(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 77
LDI r1, 34
LDI r2, 95
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 452
LDI r6, 218
LDI r7, 28
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
