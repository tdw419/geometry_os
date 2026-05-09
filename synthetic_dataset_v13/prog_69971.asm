; DESCRIPTION: Renders a purple box of size 26x23 starting at (421, 104).
; PLAN: r0=421(x), r1=104(y), r2=26(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 104
LDI r2, 26
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
