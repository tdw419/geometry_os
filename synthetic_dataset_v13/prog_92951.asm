; DESCRIPTION: Renders a blue box of size 28x17 starting at (388, 112).
; PLAN: r0=388(x), r1=112(y), r2=28(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 112
LDI r2, 28
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
