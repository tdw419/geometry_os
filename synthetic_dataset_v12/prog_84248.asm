; DESCRIPTION: Renders a yellow box of size 108x100 starting at (196, 62).
; PLAN: r0=196(x), r1=62(y), r2=108(width), r3=100(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 62
LDI r2, 108
LDI r3, 100
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
