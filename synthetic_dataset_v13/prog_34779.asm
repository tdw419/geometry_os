; DESCRIPTION: Places a black 109x67 rectangle at position (26, 28).
; PLAN: r0=26(x), r1=28(y), r2=109(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 28
LDI r2, 109
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
