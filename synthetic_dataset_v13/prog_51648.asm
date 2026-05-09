; DESCRIPTION: Renders a blue box of size 28x65 starting at (325, 112).
; PLAN: r0=325(x), r1=112(y), r2=28(width), r3=65(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 112
LDI r2, 28
LDI r3, 65
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
