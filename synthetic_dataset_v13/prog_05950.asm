; DESCRIPTION: Renders a yellow box of size 55x63 starting at (210, 88).
; PLAN: r0=210(x), r1=88(y), r2=55(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 88
LDI r2, 55
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
