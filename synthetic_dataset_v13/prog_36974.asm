; DESCRIPTION: Composite: Creates a cyan rectangular region at (344, 73) spanning 100 by 31 pixels then Renders a green disk with center (331, 91) and radius 13.
; PLAN: r0=344(x), r1=73(y), r2=100(width), r3=31(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=331(x), r6=91(y), r7=13(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 344
LDI r1, 73
LDI r2, 100
LDI r3, 31
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 331
LDI r6, 91
LDI r7, 13
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
