; DESCRIPTION: Places a yellow 19x67 rectangle at position (452, 51).
; PLAN: r0=452(x), r1=51(y), r2=19(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 51
LDI r2, 19
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
