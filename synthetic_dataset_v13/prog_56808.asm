; DESCRIPTION: Renders a blue box of size 100x21 starting at (399, 14).
; PLAN: r0=399(x), r1=14(y), r2=100(width), r3=21(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 14
LDI r2, 100
LDI r3, 21
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
