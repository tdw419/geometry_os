; DESCRIPTION: Places a orange 15x41 rectangle at position (30, 182).
; PLAN: r0=30(x), r1=182(y), r2=15(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 182
LDI r2, 15
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
