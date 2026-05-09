; DESCRIPTION: Renders a blue box of size 20x19 starting at (238, 191).
; PLAN: r0=238(x), r1=191(y), r2=20(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 191
LDI r2, 20
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
