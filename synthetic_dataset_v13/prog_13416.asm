; DESCRIPTION: Composite: Creates a purple circular shape at (150, 151) with radius 79 then Creates a magenta rectangular region at (249, 172) spanning 66 by 53 pixels.
; PLAN: r0=150(x), r1=151(y), r2=79(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=249(x), r6=172(y), r7=66(width), r8=53(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 150
LDI r1, 151
LDI r2, 79
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 249
LDI r6, 172
LDI r7, 66
LDI r8, 53
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
