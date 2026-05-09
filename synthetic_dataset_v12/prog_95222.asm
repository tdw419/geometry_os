; DESCRIPTION: Renders a yellow box of size 88x88 starting at (282, 150).
; PLAN: r0=282(x), r1=150(y), r2=88(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 150
LDI r2, 88
LDI r3, 88
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
