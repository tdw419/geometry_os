; DESCRIPTION: Composite: Creates a cyan rectangular region at (56, 85) spanning 76 by 57 pixels then Draws a yellow circle centered at (210, 188) with radius 40.
; PLAN: r0=56(x), r1=85(y), r2=76(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=210(x), r6=188(y), r7=40(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 56
LDI r1, 85
LDI r2, 76
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 210
LDI r6, 188
LDI r7, 40
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
