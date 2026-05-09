; DESCRIPTION: Renders a purple box of size 56x18 starting at (414, 22).
; PLAN: r0=414(x), r1=22(y), r2=56(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 22
LDI r2, 56
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
