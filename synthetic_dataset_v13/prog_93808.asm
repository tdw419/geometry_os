; DESCRIPTION: Places a yellow 81x67 rectangle at position (196, 118).
; PLAN: r0=196(x), r1=118(y), r2=81(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 118
LDI r2, 81
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
