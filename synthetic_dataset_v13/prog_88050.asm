; DESCRIPTION: Places a purple 86x10 rectangle at position (158, 8).
; PLAN: r0=158(x), r1=8(y), r2=86(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 8
LDI r2, 86
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
