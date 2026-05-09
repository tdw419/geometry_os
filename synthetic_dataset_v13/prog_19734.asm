; DESCRIPTION: Places a black 67x51 rectangle at position (268, 105).
; PLAN: r0=268(x), r1=105(y), r2=67(width), r3=51(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 105
LDI r2, 67
LDI r3, 51
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
