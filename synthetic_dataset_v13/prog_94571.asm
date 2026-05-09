; DESCRIPTION: Renders a blue box of size 109x22 starting at (348, 197).
; PLAN: r0=348(x), r1=197(y), r2=109(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 197
LDI r2, 109
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
