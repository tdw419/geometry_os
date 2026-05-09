; DESCRIPTION: Composite: Creates a purple circular shape at (380, 65) with radius 64 then Creates a orange rectangular region at (316, 77) spanning 10 by 20 pixels.
; PLAN: r0=380(x), r1=65(y), r2=64(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=316(x), r6=77(y), r7=10(width), r8=20(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 380
LDI r1, 65
LDI r2, 64
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 316
LDI r6, 77
LDI r7, 10
LDI r8, 20
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
