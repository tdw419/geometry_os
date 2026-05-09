; DESCRIPTION: Renders a yellow box of size 29x92 starting at (132, 31).
; PLAN: r0=132(x), r1=31(y), r2=29(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 31
LDI r2, 29
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
