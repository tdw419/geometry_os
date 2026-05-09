; DESCRIPTION: Places a black 59x118 rectangle at position (157, 36).
; PLAN: r0=157(x), r1=36(y), r2=59(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 36
LDI r2, 59
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
