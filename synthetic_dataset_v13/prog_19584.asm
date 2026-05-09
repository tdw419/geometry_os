; DESCRIPTION: Places a orange 64x106 rectangle at position (176, 66).
; PLAN: r0=176(x), r1=66(y), r2=64(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 66
LDI r2, 64
LDI r3, 106
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
