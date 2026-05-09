; DESCRIPTION: Composite: Creates a green rectangular region at (327, 149) spanning 116 by 16 pixels then Creates a white circular shape at (371, 77) with radius 44.
; PLAN: r0=327(x), r1=149(y), r2=116(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=371(x), r6=77(y), r7=44(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 327
LDI r1, 149
LDI r2, 116
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 371
LDI r6, 77
LDI r7, 44
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
