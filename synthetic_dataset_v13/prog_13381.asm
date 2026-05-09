; DESCRIPTION: Composite: Creates a purple rectangular region at (20, 145) spanning 21 by 76 pixels then Renders a cyan disk with center (304, 70) and radius 34.
; PLAN: r0=20(x), r1=145(y), r2=21(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=304(x), r6=70(y), r7=34(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 20
LDI r1, 145
LDI r2, 21
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 304
LDI r6, 70
LDI r7, 34
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
