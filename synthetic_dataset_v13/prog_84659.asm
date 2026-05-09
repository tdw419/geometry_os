; DESCRIPTION: Renders a yellow box of size 51x18 starting at (169, 61).
; PLAN: r0=169(x), r1=61(y), r2=51(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 61
LDI r2, 51
LDI r3, 18
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
