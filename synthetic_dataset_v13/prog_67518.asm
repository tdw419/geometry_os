; DESCRIPTION: Places a orange 25x99 rectangle at position (211, 41).
; PLAN: r0=211(x), r1=41(y), r2=25(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 41
LDI r2, 25
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
