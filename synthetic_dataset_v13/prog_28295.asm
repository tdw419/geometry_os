; DESCRIPTION: Places a purple 52x65 rectangle at position (196, 136).
; PLAN: r0=196(x), r1=136(y), r2=52(width), r3=65(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 136
LDI r2, 52
LDI r3, 65
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
