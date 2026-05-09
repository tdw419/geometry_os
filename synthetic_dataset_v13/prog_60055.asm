; DESCRIPTION: Renders a blue box of size 108x101 starting at (197, 150).
; PLAN: r0=197(x), r1=150(y), r2=108(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 150
LDI r2, 108
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
