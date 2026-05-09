; DESCRIPTION: Renders a blue box of size 119x27 starting at (64, 162).
; PLAN: r0=64(x), r1=162(y), r2=119(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 162
LDI r2, 119
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
