; DESCRIPTION: Places a black 69x109 rectangle at position (36, 26).
; PLAN: r0=36(x), r1=26(y), r2=69(width), r3=109(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 26
LDI r2, 69
LDI r3, 109
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
