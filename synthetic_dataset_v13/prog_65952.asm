; DESCRIPTION: Composite: Creates a magenta circular shape at (231, 128) with radius 23 then Renders a white box of size 24x55 starting at (430, 102).
; PLAN: r0=231(x), r1=128(y), r2=23(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=430(x), r6=102(y), r7=24(width), r8=55(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 231
LDI r1, 128
LDI r2, 23
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 430
LDI r6, 102
LDI r7, 24
LDI r8, 55
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
