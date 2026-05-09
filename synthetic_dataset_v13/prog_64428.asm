; DESCRIPTION: Composite: Creates a purple rectangular region at (122, 73) spanning 33 by 13 pixels then Places a purple circle of radius 31 at center (470, 109).
; PLAN: r0=122(x), r1=73(y), r2=33(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=470(x), r6=109(y), r7=31(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 122
LDI r1, 73
LDI r2, 33
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 470
LDI r6, 109
LDI r7, 31
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
