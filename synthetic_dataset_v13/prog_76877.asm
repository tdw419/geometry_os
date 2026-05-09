; DESCRIPTION: Renders a yellow box of size 69x46 starting at (80, 74).
; PLAN: r0=80(x), r1=74(y), r2=69(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 74
LDI r2, 69
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
