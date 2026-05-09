; DESCRIPTION: Places a blue 14x52 rectangle at position (101, 101).
; PLAN: r0=101(x), r1=101(y), r2=14(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 101
LDI r2, 14
LDI r3, 52
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
