; DESCRIPTION: Composite: Creates a cyan circular shape at (106, 193) with radius 41 then Creates a magenta rectangular region at (368, 88) spanning 28 by 110 pixels.
; PLAN: r0=106(x), r1=193(y), r2=41(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=368(x), r6=88(y), r7=28(width), r8=110(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 106
LDI r1, 193
LDI r2, 41
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 368
LDI r6, 88
LDI r7, 28
LDI r8, 110
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
