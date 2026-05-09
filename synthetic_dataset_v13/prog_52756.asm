; DESCRIPTION: Places a orange 77x39 rectangle at position (192, 66).
; PLAN: r0=192(x), r1=66(y), r2=77(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 66
LDI r2, 77
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
