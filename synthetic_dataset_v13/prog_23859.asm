; DESCRIPTION: Places a orange 107x112 rectangle at position (365, 87).
; PLAN: r0=365(x), r1=87(y), r2=107(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 87
LDI r2, 107
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
