; DESCRIPTION: Places a orange 103x13 rectangle at position (170, 31).
; PLAN: r0=170(x), r1=31(y), r2=103(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 31
LDI r2, 103
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
