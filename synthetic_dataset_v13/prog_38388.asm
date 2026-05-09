; DESCRIPTION: Renders a blue box of size 46x13 starting at (315, 189).
; PLAN: r0=315(x), r1=189(y), r2=46(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 189
LDI r2, 46
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
