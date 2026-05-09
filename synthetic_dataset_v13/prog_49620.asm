; DESCRIPTION: Places a yellow 88x38 rectangle at position (161, 136).
; PLAN: r0=161(x), r1=136(y), r2=88(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 136
LDI r2, 88
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
