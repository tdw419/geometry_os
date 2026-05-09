; DESCRIPTION: Composite: Places a purple 16x76 rectangle at position (281, 87) then Creates a orange circular shape at (258, 82) with radius 72.
; PLAN: r0=281(x), r1=87(y), r2=16(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=258(x), r6=82(y), r7=72(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 281
LDI r1, 87
LDI r2, 16
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 258
LDI r6, 82
LDI r7, 72
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
