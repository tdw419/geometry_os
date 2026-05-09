; DESCRIPTION: Places a orange 19x83 rectangle at position (358, 142).
; PLAN: r0=358(x), r1=142(y), r2=19(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 142
LDI r2, 19
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
