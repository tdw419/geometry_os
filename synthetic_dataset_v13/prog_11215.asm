; DESCRIPTION: Composite: Creates a cyan rectangular region at (327, 46) spanning 49 by 77 pixels then Draws a white circle centered at (73, 63) with radius 14.
; PLAN: r0=327(x), r1=46(y), r2=49(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=73(x), r6=63(y), r7=14(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 327
LDI r1, 46
LDI r2, 49
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 73
LDI r6, 63
LDI r7, 14
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
