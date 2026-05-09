; DESCRIPTION: Renders a yellow box of size 55x19 starting at (22, 65).
; PLAN: r0=22(x), r1=65(y), r2=55(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 65
LDI r2, 55
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
