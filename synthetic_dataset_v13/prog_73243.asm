; DESCRIPTION: Places a orange 71x36 rectangle at position (411, 121).
; PLAN: r0=411(x), r1=121(y), r2=71(width), r3=36(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 121
LDI r2, 71
LDI r3, 36
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
