; DESCRIPTION: Renders a blue box of size 99x56 starting at (310, 22).
; PLAN: r0=310(x), r1=22(y), r2=99(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 22
LDI r2, 99
LDI r3, 56
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
