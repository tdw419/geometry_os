; DESCRIPTION: Places a orange 105x106 rectangle at position (101, 139).
; PLAN: r0=101(x), r1=139(y), r2=105(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 139
LDI r2, 105
LDI r3, 106
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
