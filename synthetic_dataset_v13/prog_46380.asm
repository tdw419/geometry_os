; DESCRIPTION: Renders a blue box of size 93x32 starting at (328, 155).
; PLAN: r0=328(x), r1=155(y), r2=93(width), r3=32(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 155
LDI r2, 93
LDI r3, 32
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
