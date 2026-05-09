; DESCRIPTION: Places a orange 97x76 rectangle at position (365, 127).
; PLAN: r0=365(x), r1=127(y), r2=97(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 127
LDI r2, 97
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
