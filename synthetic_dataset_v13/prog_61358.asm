; DESCRIPTION: Composite: Draws a cyan circle centered at (127, 116) with radius 58 then Creates a red rectangular region at (163, 117) spanning 66 by 115 pixels.
; PLAN: r0=127(x), r1=116(y), r2=58(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=163(x), r6=117(y), r7=66(width), r8=115(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 127
LDI r1, 116
LDI r2, 58
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 163
LDI r6, 117
LDI r7, 66
LDI r8, 115
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
