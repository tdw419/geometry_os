; DESCRIPTION: Composite: Creates a cyan rectangular region at (119, 140) spanning 80 by 88 pixels then Places a magenta dot at position (344, 244).
; PLAN: r0=119(x), r1=140(y), r2=80(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=344(x), r6=244(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 119
LDI r1, 140
LDI r2, 80
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 344
LDI r6, 244
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
