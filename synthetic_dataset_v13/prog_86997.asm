; DESCRIPTION: Places a yellow 66x67 rectangle at position (232, 59).
; PLAN: r0=232(x), r1=59(y), r2=66(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 59
LDI r2, 66
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
