; DESCRIPTION: Places a green 74x36 rectangle at position (84, 196).
; PLAN: r0=84(x), r1=196(y), r2=74(width), r3=36(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 196
LDI r2, 74
LDI r3, 36
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
