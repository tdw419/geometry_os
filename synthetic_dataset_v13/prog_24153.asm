; DESCRIPTION: Places a black 82x94 rectangle at position (300, 67).
; PLAN: r0=300(x), r1=67(y), r2=82(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 67
LDI r2, 82
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
