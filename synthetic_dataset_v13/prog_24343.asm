; DESCRIPTION: Places a purple 101x22 rectangle at position (52, 60).
; PLAN: r0=52(x), r1=60(y), r2=101(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 60
LDI r2, 101
LDI r3, 22
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
