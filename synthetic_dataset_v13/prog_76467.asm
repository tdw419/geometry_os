; DESCRIPTION: Places a cyan 112x114 rectangle at position (19, 74).
; PLAN: r0=19(x), r1=74(y), r2=112(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 74
LDI r2, 112
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
