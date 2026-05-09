; DESCRIPTION: Composite: Creates a yellow circular shape at (256, 105) with radius 68 then Places a yellow 87x67 rectangle at position (212, 154).
; PLAN: r0=256(x), r1=105(y), r2=68(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=212(x), r6=154(y), r7=87(width), r8=67(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 256
LDI r1, 105
LDI r2, 68
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 212
LDI r6, 154
LDI r7, 87
LDI r8, 67
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
