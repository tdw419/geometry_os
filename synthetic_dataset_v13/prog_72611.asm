; DESCRIPTION: Places a black 67x63 rectangle at position (250, 187).
; PLAN: r0=250(x), r1=187(y), r2=67(width), r3=63(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 187
LDI r2, 67
LDI r3, 63
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
