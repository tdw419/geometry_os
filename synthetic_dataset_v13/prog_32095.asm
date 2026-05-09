; DESCRIPTION: Renders a blue box of size 54x49 starting at (102, 0).
; PLAN: r0=102(x), r1=0(y), r2=54(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 0
LDI r2, 54
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
