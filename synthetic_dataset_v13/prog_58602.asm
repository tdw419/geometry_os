; DESCRIPTION: Renders a blue box of size 27x78 starting at (238, 112).
; PLAN: r0=238(x), r1=112(y), r2=27(width), r3=78(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 112
LDI r2, 27
LDI r3, 78
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
