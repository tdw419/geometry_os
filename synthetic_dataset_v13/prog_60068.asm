; DESCRIPTION: Places a orange 49x83 rectangle at position (192, 148).
; PLAN: r0=192(x), r1=148(y), r2=49(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 148
LDI r2, 49
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
