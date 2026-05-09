; DESCRIPTION: Renders a yellow box of size 88x10 starting at (320, 216).
; PLAN: r0=320(x), r1=216(y), r2=88(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 216
LDI r2, 88
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
