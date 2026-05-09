; DESCRIPTION: Renders a yellow box of size 29x51 starting at (90, 152).
; PLAN: r0=90(x), r1=152(y), r2=29(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 152
LDI r2, 29
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
