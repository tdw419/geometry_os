; DESCRIPTION: Renders a blue box of size 108x110 starting at (137, 103).
; PLAN: r0=137(x), r1=103(y), r2=108(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 103
LDI r2, 108
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
