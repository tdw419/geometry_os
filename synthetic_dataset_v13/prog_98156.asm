; DESCRIPTION: Composite: Renders a green disk with center (469, 66) and radius 21 then Creates a purple rectangular region at (76, 4) spanning 96 by 31 pixels.
; PLAN: r0=469(x), r1=66(y), r2=21(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=76(x), r6=4(y), r7=96(width), r8=31(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 469
LDI r1, 66
LDI r2, 21
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 76
LDI r6, 4
LDI r7, 96
LDI r8, 31
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
