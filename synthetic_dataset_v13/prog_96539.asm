; DESCRIPTION: Places a orange 112x41 rectangle at position (100, 180).
; PLAN: r0=100(x), r1=180(y), r2=112(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 180
LDI r2, 112
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
