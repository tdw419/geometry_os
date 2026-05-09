; DESCRIPTION: Renders a blue box of size 106x28 starting at (327, 219).
; PLAN: r0=327(x), r1=219(y), r2=106(width), r3=28(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 219
LDI r2, 106
LDI r3, 28
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
