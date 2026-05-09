; DESCRIPTION: Renders a blue box of size 79x43 starting at (285, 123).
; PLAN: r0=285(x), r1=123(y), r2=79(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 123
LDI r2, 79
LDI r3, 43
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
