; DESCRIPTION: Renders a blue box of size 53x25 starting at (323, 49).
; PLAN: r0=323(x), r1=49(y), r2=53(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 49
LDI r2, 53
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
