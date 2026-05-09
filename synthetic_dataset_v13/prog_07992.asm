; DESCRIPTION: Renders a blue box of size 36x58 starting at (426, 103).
; PLAN: r0=426(x), r1=103(y), r2=36(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 103
LDI r2, 36
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
