; DESCRIPTION: Renders a blue box of size 15x73 starting at (486, 2).
; PLAN: r0=486(x), r1=2(y), r2=15(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 2
LDI r2, 15
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
