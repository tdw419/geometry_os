; DESCRIPTION: Places a blue 88x35 rectangle at position (234, 129).
; PLAN: r0=234(x), r1=129(y), r2=88(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 129
LDI r2, 88
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
