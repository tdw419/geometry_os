; DESCRIPTION: Places a orange 66x36 rectangle at position (330, 128).
; PLAN: r0=330(x), r1=128(y), r2=66(width), r3=36(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 128
LDI r2, 66
LDI r3, 36
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
