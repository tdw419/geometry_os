; DESCRIPTION: Composite: Creates a cyan rectangular region at (251, 89) spanning 80 by 99 pixels then Draws a green circle centered at (143, 113) with radius 73.
; PLAN: r0=251(x), r1=89(y), r2=80(width), r3=99(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=143(x), r6=113(y), r7=73(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 251
LDI r1, 89
LDI r2, 80
LDI r3, 99
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 143
LDI r6, 113
LDI r7, 73
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
