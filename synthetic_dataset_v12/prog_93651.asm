; DESCRIPTION: Renders a blue box of size 56x102 starting at (357, 0).
; PLAN: r0=357(x), r1=0(y), r2=56(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 0
LDI r2, 56
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
