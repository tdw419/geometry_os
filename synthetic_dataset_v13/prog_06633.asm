; DESCRIPTION: Renders a blue box of size 106x36 starting at (299, 25).
; PLAN: r0=299(x), r1=25(y), r2=106(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 25
LDI r2, 106
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
