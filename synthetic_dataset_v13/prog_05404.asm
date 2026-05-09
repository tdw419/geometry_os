; DESCRIPTION: Composite: Creates a green rectangular region at (366, 101) spanning 61 by 48 pixels then Creates a red circular shape at (127, 119) with radius 41.
; PLAN: r0=366(x), r1=101(y), r2=61(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=127(x), r6=119(y), r7=41(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 366
LDI r1, 101
LDI r2, 61
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 127
LDI r6, 119
LDI r7, 41
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
