; DESCRIPTION: Composite: Creates a cyan rectangular region at (91, 93) spanning 72 by 95 pixels then Draws a white circle centered at (462, 40) with radius 37.
; PLAN: r0=91(x), r1=93(y), r2=72(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=462(x), r6=40(y), r7=37(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 91
LDI r1, 93
LDI r2, 72
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 462
LDI r6, 40
LDI r7, 37
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
