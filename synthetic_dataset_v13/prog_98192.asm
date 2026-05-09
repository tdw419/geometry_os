; DESCRIPTION: Renders a blue box of size 57x73 starting at (244, 74).
; PLAN: r0=244(x), r1=74(y), r2=57(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 74
LDI r2, 57
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
