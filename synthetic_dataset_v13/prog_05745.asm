; DESCRIPTION: Places a black 12x22 rectangle at position (67, 67).
; PLAN: r0=67(x), r1=67(y), r2=12(width), r3=22(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 67
LDI r2, 12
LDI r3, 22
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
