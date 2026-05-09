; DESCRIPTION: Places a black 74x69 rectangle at position (259, 4).
; PLAN: r0=259(x), r1=4(y), r2=74(width), r3=69(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 4
LDI r2, 74
LDI r3, 69
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
