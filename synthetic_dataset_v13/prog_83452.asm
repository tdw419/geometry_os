; DESCRIPTION: Composite: Creates a magenta rectangular region at (142, 143) spanning 56 by 41 pixels then Creates a orange circular shape at (295, 209) with radius 25.
; PLAN: r0=142(x), r1=143(y), r2=56(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=295(x), r6=209(y), r7=25(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 142
LDI r1, 143
LDI r2, 56
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 295
LDI r6, 209
LDI r7, 25
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
