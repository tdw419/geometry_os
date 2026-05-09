; DESCRIPTION: Composite: Creates a orange circular shape at (112, 159) with radius 78 then Creates a magenta rectangular region at (204, 50) spanning 68 by 57 pixels.
; PLAN: r0=112(x), r1=159(y), r2=78(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=204(x), r6=50(y), r7=68(width), r8=57(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 112
LDI r1, 159
LDI r2, 78
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 204
LDI r6, 50
LDI r7, 68
LDI r8, 57
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
