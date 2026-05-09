; DESCRIPTION: Renders a yellow box of size 85x29 starting at (399, 216).
; PLAN: r0=399(x), r1=216(y), r2=85(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 216
LDI r2, 85
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
