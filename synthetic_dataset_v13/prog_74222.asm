; DESCRIPTION: Renders a blue box of size 22x74 starting at (388, 48).
; PLAN: r0=388(x), r1=48(y), r2=22(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 48
LDI r2, 22
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
