; DESCRIPTION: Composite: Creates a purple circular shape at (103, 57) with radius 26 then Renders a orange box of size 32x72 starting at (107, 124).
; PLAN: r0=103(x), r1=57(y), r2=26(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=107(x), r6=124(y), r7=32(width), r8=72(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 103
LDI r1, 57
LDI r2, 26
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 107
LDI r6, 124
LDI r7, 32
LDI r8, 72
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
