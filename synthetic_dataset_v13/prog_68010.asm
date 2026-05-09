; DESCRIPTION: Composite: Creates a orange rectangular region at (238, 59) spanning 115 by 79 pixels then Draws a white circle centered at (45, 92) with radius 23.
; PLAN: r0=238(x), r1=59(y), r2=115(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=45(x), r6=92(y), r7=23(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 238
LDI r1, 59
LDI r2, 115
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 45
LDI r6, 92
LDI r7, 23
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
