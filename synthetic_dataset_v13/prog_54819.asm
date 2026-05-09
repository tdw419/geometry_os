; DESCRIPTION: Composite: Places a red 71x56 rectangle at position (271, 97) then Creates a orange circular shape at (357, 109) with radius 50.
; PLAN: r0=271(x), r1=97(y), r2=71(width), r3=56(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=357(x), r6=109(y), r7=50(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 271
LDI r1, 97
LDI r2, 71
LDI r3, 56
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 357
LDI r6, 109
LDI r7, 50
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
