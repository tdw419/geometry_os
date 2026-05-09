; DESCRIPTION: Renders a blue box of size 68x14 starting at (210, 74).
; PLAN: r0=210(x), r1=74(y), r2=68(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 74
LDI r2, 68
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
