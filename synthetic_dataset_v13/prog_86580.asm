; DESCRIPTION: Renders a blue box of size 25x23 starting at (209, 227).
; PLAN: r0=209(x), r1=227(y), r2=25(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 227
LDI r2, 25
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
