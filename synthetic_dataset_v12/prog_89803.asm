; DESCRIPTION: Places a purple 88x102 rectangle at position (196, 80).
; PLAN: r0=196(x), r1=80(y), r2=88(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 80
LDI r2, 88
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
