; DESCRIPTION: Renders a blue box of size 101x82 starting at (132, 83).
; PLAN: r0=132(x), r1=83(y), r2=101(width), r3=82(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 83
LDI r2, 101
LDI r3, 82
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
