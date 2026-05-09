; DESCRIPTION: Places a yellow 70x67 rectangle at position (51, 157).
; PLAN: r0=51(x), r1=157(y), r2=70(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 157
LDI r2, 70
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
