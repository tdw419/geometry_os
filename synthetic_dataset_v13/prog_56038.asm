; DESCRIPTION: Renders a yellow box of size 84x70 starting at (158, 67).
; PLAN: r0=158(x), r1=67(y), r2=84(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 67
LDI r2, 84
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
