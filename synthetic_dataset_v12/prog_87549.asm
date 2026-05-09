; DESCRIPTION: Places a orange 55x62 rectangle at position (334, 58).
; PLAN: r0=334(x), r1=58(y), r2=55(width), r3=62(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 58
LDI r2, 55
LDI r3, 62
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
