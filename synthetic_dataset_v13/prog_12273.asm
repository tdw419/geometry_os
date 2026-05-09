; DESCRIPTION: Renders a blue box of size 77x67 starting at (202, 102).
; PLAN: r0=202(x), r1=102(y), r2=77(width), r3=67(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 102
LDI r2, 77
LDI r3, 67
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
