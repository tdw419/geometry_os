; DESCRIPTION: Places a black 35x67 rectangle at position (278, 182).
; PLAN: r0=278(x), r1=182(y), r2=35(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 182
LDI r2, 35
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
