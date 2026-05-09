; DESCRIPTION: Places a orange 107x119 rectangle at position (286, 99).
; PLAN: r0=286(x), r1=99(y), r2=107(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 99
LDI r2, 107
LDI r3, 119
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
