; DESCRIPTION: Renders a blue box of size 110x115 starting at (356, 2).
; PLAN: r0=356(x), r1=2(y), r2=110(width), r3=115(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 2
LDI r2, 110
LDI r3, 115
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
