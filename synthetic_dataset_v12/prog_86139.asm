; DESCRIPTION: Places a orange 52x103 rectangle at position (252, 33).
; PLAN: r0=252(x), r1=33(y), r2=52(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 33
LDI r2, 52
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
