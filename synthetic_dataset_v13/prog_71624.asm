; DESCRIPTION: Renders a yellow box of size 73x110 starting at (32, 67).
; PLAN: r0=32(x), r1=67(y), r2=73(width), r3=110(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 67
LDI r2, 73
LDI r3, 110
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
