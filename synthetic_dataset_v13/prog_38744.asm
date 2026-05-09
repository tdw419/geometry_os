; DESCRIPTION: Renders a blue box of size 71x14 starting at (419, 52).
; PLAN: r0=419(x), r1=52(y), r2=71(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 52
LDI r2, 71
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
