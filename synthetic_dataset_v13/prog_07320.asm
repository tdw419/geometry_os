; DESCRIPTION: Places a blue 52x117 rectangle at position (170, 74).
; PLAN: r0=170(x), r1=74(y), r2=52(width), r3=117(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 74
LDI r2, 52
LDI r3, 117
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
