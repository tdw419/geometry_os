; DESCRIPTION: Places a orange 16x28 rectangle at position (41, 119).
; PLAN: r0=41(x), r1=119(y), r2=16(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 119
LDI r2, 16
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
