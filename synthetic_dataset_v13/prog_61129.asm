; DESCRIPTION: Places a purple 74x114 rectangle at position (27, 117).
; PLAN: r0=27(x), r1=117(y), r2=74(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 117
LDI r2, 74
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
