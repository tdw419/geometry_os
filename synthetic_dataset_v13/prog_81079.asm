; DESCRIPTION: Places a red 100x69 rectangle at position (97, 33).
; PLAN: r0=97(x), r1=33(y), r2=100(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 33
LDI r2, 100
LDI r3, 69
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
