; DESCRIPTION: Renders a yellow box of size 14x67 starting at (219, 35).
; PLAN: r0=219(x), r1=35(y), r2=14(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 35
LDI r2, 14
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
