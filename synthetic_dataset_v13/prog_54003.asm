; DESCRIPTION: Renders a yellow box of size 49x110 starting at (215, 33).
; PLAN: r0=215(x), r1=33(y), r2=49(width), r3=110(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 33
LDI r2, 49
LDI r3, 110
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
