; DESCRIPTION: Composite: Creates a cyan rectangular region at (313, 38) spanning 73 by 54 pixels then Draws a white circle centered at (226, 63) with radius 45.
; PLAN: r0=313(x), r1=38(y), r2=73(width), r3=54(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=226(x), r6=63(y), r7=45(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 313
LDI r1, 38
LDI r2, 73
LDI r3, 54
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 226
LDI r6, 63
LDI r7, 45
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
