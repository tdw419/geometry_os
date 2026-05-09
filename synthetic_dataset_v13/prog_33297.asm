; DESCRIPTION: Renders a yellow box of size 110x67 starting at (329, 136).
; PLAN: r0=329(x), r1=136(y), r2=110(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 136
LDI r2, 110
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
