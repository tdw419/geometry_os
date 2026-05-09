; DESCRIPTION: Composite: Creates a cyan circular shape at (305, 81) with radius 73 then Creates a purple rectangular region at (347, 9) spanning 20 by 69 pixels.
; PLAN: r0=305(x), r1=81(y), r2=73(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=347(x), r6=9(y), r7=20(width), r8=69(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 305
LDI r1, 81
LDI r2, 73
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 347
LDI r6, 9
LDI r7, 20
LDI r8, 69
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
