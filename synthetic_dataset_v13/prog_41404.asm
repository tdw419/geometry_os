; DESCRIPTION: Places a blue 99x96 rectangle at position (67, 41).
; PLAN: r0=67(x), r1=41(y), r2=99(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 41
LDI r2, 99
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
