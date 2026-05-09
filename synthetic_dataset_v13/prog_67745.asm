; DESCRIPTION: Renders a yellow box of size 106x29 starting at (118, 0).
; PLAN: r0=118(x), r1=0(y), r2=106(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 0
LDI r2, 106
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
