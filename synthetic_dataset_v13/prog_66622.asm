; DESCRIPTION: Renders a blue box of size 25x62 starting at (389, 103).
; PLAN: r0=389(x), r1=103(y), r2=25(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 103
LDI r2, 25
LDI r3, 62
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
