; DESCRIPTION: Composite: Creates a cyan rectangular region at (300, 64) spanning 115 by 34 pixels then Draws a purple circle centered at (105, 170) with radius 25.
; PLAN: r0=300(x), r1=64(y), r2=115(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=105(x), r6=170(y), r7=25(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 300
LDI r1, 64
LDI r2, 115
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 105
LDI r6, 170
LDI r7, 25
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
