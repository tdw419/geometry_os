; DESCRIPTION: Renders a yellow box of size 88x11 starting at (130, 237).
; PLAN: r0=130(x), r1=237(y), r2=88(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 237
LDI r2, 88
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
