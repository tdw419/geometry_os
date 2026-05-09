; DESCRIPTION: Renders a yellow box of size 71x97 starting at (64, 148).
; PLAN: r0=64(x), r1=148(y), r2=71(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 148
LDI r2, 71
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
