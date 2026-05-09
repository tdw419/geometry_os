; DESCRIPTION: Renders a blue box of size 11x14 starting at (103, 181).
; PLAN: r0=103(x), r1=181(y), r2=11(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 181
LDI r2, 11
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
