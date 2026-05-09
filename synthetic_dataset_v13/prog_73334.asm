; DESCRIPTION: Composite: Creates a orange circular shape at (188, 118) with radius 72 then Creates a cyan rectangular region at (143, 223) spanning 87 by 10 pixels.
; PLAN: r0=188(x), r1=118(y), r2=72(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=143(x), r6=223(y), r7=87(width), r8=10(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 188
LDI r1, 118
LDI r2, 72
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 143
LDI r6, 223
LDI r7, 87
LDI r8, 10
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
