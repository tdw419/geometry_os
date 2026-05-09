; DESCRIPTION: Renders a purple box of size 46x92 starting at (138, 10).
; PLAN: r0=138(x), r1=10(y), r2=46(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 10
LDI r2, 46
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
