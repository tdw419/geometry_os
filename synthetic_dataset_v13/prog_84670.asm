; DESCRIPTION: Composite: Creates a cyan rectangular region at (176, 97) spanning 96 by 97 pixels then Draws a white circle centered at (349, 112) with radius 45.
; PLAN: r0=176(x), r1=97(y), r2=96(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=349(x), r6=112(y), r7=45(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 176
LDI r1, 97
LDI r2, 96
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 349
LDI r6, 112
LDI r7, 45
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
