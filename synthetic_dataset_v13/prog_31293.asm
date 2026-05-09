; DESCRIPTION: Places a orange 23x100 rectangle at position (124, 8).
; PLAN: r0=124(x), r1=8(y), r2=23(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 8
LDI r2, 23
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
