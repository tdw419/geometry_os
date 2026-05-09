; DESCRIPTION: Renders a blue box of size 92x81 starting at (68, 31).
; PLAN: r0=68(x), r1=31(y), r2=92(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 31
LDI r2, 92
LDI r3, 81
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
