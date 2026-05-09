; DESCRIPTION: Places a orange 117x34 rectangle at position (100, 3).
; PLAN: r0=100(x), r1=3(y), r2=117(width), r3=34(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 3
LDI r2, 117
LDI r3, 34
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
