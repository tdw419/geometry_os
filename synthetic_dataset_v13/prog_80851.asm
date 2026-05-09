; DESCRIPTION: Composite: Places a cyan circle of radius 65 at center (172, 159) then Creates a orange rectangular region at (145, 162) spanning 101 by 61 pixels.
; PLAN: r0=172(x), r1=159(y), r2=65(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=145(x), r6=162(y), r7=101(width), r8=61(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 172
LDI r1, 159
LDI r2, 65
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 145
LDI r6, 162
LDI r7, 101
LDI r8, 61
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
