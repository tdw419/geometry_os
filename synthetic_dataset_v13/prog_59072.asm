; DESCRIPTION: Places a yellow 74x31 rectangle at position (67, 132).
; PLAN: r0=67(x), r1=132(y), r2=74(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 132
LDI r2, 74
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
