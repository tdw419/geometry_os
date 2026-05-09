; DESCRIPTION: Renders a blue box of size 80x103 starting at (291, 71).
; PLAN: r0=291(x), r1=71(y), r2=80(width), r3=103(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 71
LDI r2, 80
LDI r3, 103
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
