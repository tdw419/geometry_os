; DESCRIPTION: Renders a blue box of size 68x64 starting at (96, 105).
; PLAN: r0=96(x), r1=105(y), r2=68(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 105
LDI r2, 68
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
