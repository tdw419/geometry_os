; DESCRIPTION: Places a orange 66x51 rectangle at position (134, 60).
; PLAN: r0=134(x), r1=60(y), r2=66(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 60
LDI r2, 66
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
