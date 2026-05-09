; DESCRIPTION: Renders a blue box of size 28x35 starting at (256, 62).
; PLAN: r0=256(x), r1=62(y), r2=28(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 62
LDI r2, 28
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
