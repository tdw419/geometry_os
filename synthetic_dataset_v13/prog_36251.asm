; DESCRIPTION: Places a orange 101x26 rectangle at position (282, 189).
; PLAN: r0=282(x), r1=189(y), r2=101(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 189
LDI r2, 101
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
