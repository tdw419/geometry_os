; DESCRIPTION: Places a black 59x67 rectangle at position (108, 72).
; PLAN: r0=108(x), r1=72(y), r2=59(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 72
LDI r2, 59
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
