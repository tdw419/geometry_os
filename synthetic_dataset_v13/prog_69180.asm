; DESCRIPTION: Places a orange 19x56 rectangle at position (189, 140).
; PLAN: r0=189(x), r1=140(y), r2=19(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 140
LDI r2, 19
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
