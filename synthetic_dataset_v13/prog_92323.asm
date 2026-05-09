; DESCRIPTION: Renders a blue box of size 77x108 starting at (102, 34).
; PLAN: r0=102(x), r1=34(y), r2=77(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 34
LDI r2, 77
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
