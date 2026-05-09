; DESCRIPTION: Places a black 100x67 rectangle at position (290, 163).
; PLAN: r0=290(x), r1=163(y), r2=100(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 163
LDI r2, 100
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
