; DESCRIPTION: Places a black 83x51 rectangle at position (67, 90).
; PLAN: r0=67(x), r1=90(y), r2=83(width), r3=51(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 90
LDI r2, 83
LDI r3, 51
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
