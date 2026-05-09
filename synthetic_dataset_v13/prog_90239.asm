; DESCRIPTION: Composite: Creates a red rectangular region at (72, 8) spanning 20 by 38 pixels then Creates a cyan circular shape at (119, 129) with radius 66.
; PLAN: r0=72(x), r1=8(y), r2=20(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=119(x), r6=129(y), r7=66(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 72
LDI r1, 8
LDI r2, 20
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 119
LDI r6, 129
LDI r7, 66
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
