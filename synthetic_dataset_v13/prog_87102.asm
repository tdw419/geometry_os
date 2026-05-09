; DESCRIPTION: Places a orange 55x51 rectangle at position (215, 41).
; PLAN: r0=215(x), r1=41(y), r2=55(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 41
LDI r2, 55
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
