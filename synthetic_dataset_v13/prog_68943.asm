; DESCRIPTION: Places a orange 23x33 rectangle at position (10, 66).
; PLAN: r0=10(x), r1=66(y), r2=23(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 66
LDI r2, 23
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
