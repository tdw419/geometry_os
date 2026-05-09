; DESCRIPTION: Places a orange 69x16 rectangle at position (33, 233).
; PLAN: r0=33(x), r1=233(y), r2=69(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 233
LDI r2, 69
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
