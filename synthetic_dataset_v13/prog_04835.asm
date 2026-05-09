; DESCRIPTION: Places a orange 79x51 rectangle at position (34, 95).
; PLAN: r0=34(x), r1=95(y), r2=79(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 95
LDI r2, 79
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
