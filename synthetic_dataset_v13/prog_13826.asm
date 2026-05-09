; DESCRIPTION: Renders a yellow box of size 65x10 starting at (169, 69).
; PLAN: r0=169(x), r1=69(y), r2=65(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 69
LDI r2, 65
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
