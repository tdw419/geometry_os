; DESCRIPTION: Renders a blue box of size 28x49 starting at (252, 180).
; PLAN: r0=252(x), r1=180(y), r2=28(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 180
LDI r2, 28
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
