; DESCRIPTION: Places a black 52x69 rectangle at position (313, 26).
; PLAN: r0=313(x), r1=26(y), r2=52(width), r3=69(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 26
LDI r2, 52
LDI r3, 69
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
