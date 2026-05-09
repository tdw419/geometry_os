; DESCRIPTION: Places a orange 19x101 rectangle at position (269, 127).
; PLAN: r0=269(x), r1=127(y), r2=19(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 127
LDI r2, 19
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
