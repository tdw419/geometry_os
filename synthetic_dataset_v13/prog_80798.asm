; DESCRIPTION: Places a purple 81x21 rectangle at position (148, 136).
; PLAN: r0=148(x), r1=136(y), r2=81(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 136
LDI r2, 81
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
