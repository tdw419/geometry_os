; DESCRIPTION: Renders a blue box of size 114x50 starting at (33, 129).
; PLAN: r0=33(x), r1=129(y), r2=114(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 129
LDI r2, 114
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
