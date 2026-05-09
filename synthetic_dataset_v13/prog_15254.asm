; DESCRIPTION: Places a black 97x69 rectangle at position (279, 102).
; PLAN: r0=279(x), r1=102(y), r2=97(width), r3=69(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 102
LDI r2, 97
LDI r3, 69
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
