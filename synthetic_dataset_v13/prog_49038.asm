; DESCRIPTION: Renders a blue box of size 33x13 starting at (204, 5).
; PLAN: r0=204(x), r1=5(y), r2=33(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 5
LDI r2, 33
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
