; DESCRIPTION: Composite: Places a green circle of radius 63 at center (97, 116) then Creates a white rectangular region at (160, 73) spanning 106 by 94 pixels.
; PLAN: r0=97(x), r1=116(y), r2=63(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=160(x), r6=73(y), r7=106(width), r8=94(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 97
LDI r1, 116
LDI r2, 63
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 160
LDI r6, 73
LDI r7, 106
LDI r8, 94
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
