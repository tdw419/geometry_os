; DESCRIPTION: Places a blue 81x10 rectangle at position (339, 48).
; PLAN: r0=339(x), r1=48(y), r2=81(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 48
LDI r2, 81
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
