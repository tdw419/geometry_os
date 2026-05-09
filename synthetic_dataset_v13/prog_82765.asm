; DESCRIPTION: Places a yellow 67x27 rectangle at position (105, 78).
; PLAN: r0=105(x), r1=78(y), r2=67(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 78
LDI r2, 67
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
