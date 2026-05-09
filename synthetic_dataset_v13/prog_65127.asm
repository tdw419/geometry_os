; DESCRIPTION: Renders a blue box of size 95x105 starting at (36, 5).
; PLAN: r0=36(x), r1=5(y), r2=95(width), r3=105(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 5
LDI r2, 95
LDI r3, 105
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
