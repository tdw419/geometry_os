; DESCRIPTION: Renders a yellow box of size 44x116 starting at (389, 123).
; PLAN: r0=389(x), r1=123(y), r2=44(width), r3=116(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 123
LDI r2, 44
LDI r3, 116
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
