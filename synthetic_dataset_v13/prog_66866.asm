; DESCRIPTION: Places a purple 11x14 rectangle at position (136, 136).
; PLAN: r0=136(x), r1=136(y), r2=11(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 136
LDI r2, 11
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
