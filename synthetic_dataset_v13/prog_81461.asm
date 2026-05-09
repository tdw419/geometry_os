; DESCRIPTION: Renders a blue box of size 96x94 starting at (167, 20).
; PLAN: r0=167(x), r1=20(y), r2=96(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 20
LDI r2, 96
LDI r3, 94
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
