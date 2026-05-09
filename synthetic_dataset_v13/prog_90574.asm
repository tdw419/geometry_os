; DESCRIPTION: Renders a blue box of size 42x51 starting at (356, 36).
; PLAN: r0=356(x), r1=36(y), r2=42(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 36
LDI r2, 42
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
