; DESCRIPTION: Composite: Places a purple circle of radius 40 at center (231, 77) then Places a orange 29x30 rectangle at position (156, 181).
; PLAN: r0=231(x), r1=77(y), r2=40(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=156(x), r6=181(y), r7=29(width), r8=30(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 231
LDI r1, 77
LDI r2, 40
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 156
LDI r6, 181
LDI r7, 29
LDI r8, 30
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
