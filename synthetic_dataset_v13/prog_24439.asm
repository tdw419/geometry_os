; DESCRIPTION: Places a black 90x52 rectangle at position (124, 67).
; PLAN: r0=124(x), r1=67(y), r2=90(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 67
LDI r2, 90
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
