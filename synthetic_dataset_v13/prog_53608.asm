; DESCRIPTION: Renders a yellow box of size 119x28 starting at (161, 189).
; PLAN: r0=161(x), r1=189(y), r2=119(width), r3=28(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 189
LDI r2, 119
LDI r3, 28
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
