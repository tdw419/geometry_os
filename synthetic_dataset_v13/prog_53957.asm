; DESCRIPTION: Places a orange 45x114 rectangle at position (123, 38).
; PLAN: r0=123(x), r1=38(y), r2=45(width), r3=114(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 38
LDI r2, 45
LDI r3, 114
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
