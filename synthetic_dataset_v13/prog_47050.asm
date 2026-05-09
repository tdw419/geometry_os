; DESCRIPTION: Composite: Creates a orange circular shape at (399, 173) with radius 57 then Renders a purple box of size 81x48 starting at (222, 104).
; PLAN: r0=399(x), r1=173(y), r2=57(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=222(x), r6=104(y), r7=81(width), r8=48(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 399
LDI r1, 173
LDI r2, 57
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 222
LDI r6, 104
LDI r7, 81
LDI r8, 48
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
