; DESCRIPTION: Renders a blue box of size 12x10 starting at (108, 112).
; PLAN: r0=108(x), r1=112(y), r2=12(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 112
LDI r2, 12
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
