; DESCRIPTION: Places a orange 49x84 rectangle at position (123, 27).
; PLAN: r0=123(x), r1=27(y), r2=49(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 27
LDI r2, 49
LDI r3, 84
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
