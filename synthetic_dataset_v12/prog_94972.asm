; DESCRIPTION: Renders a yellow box of size 87x34 starting at (299, 136).
; PLAN: r0=299(x), r1=136(y), r2=87(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 136
LDI r2, 87
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
