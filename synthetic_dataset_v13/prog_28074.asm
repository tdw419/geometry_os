; DESCRIPTION: Places a orange 19x96 rectangle at position (426, 73).
; PLAN: r0=426(x), r1=73(y), r2=19(width), r3=96(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 73
LDI r2, 19
LDI r3, 96
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
