; DESCRIPTION: Renders a blue box of size 69x87 starting at (357, 148).
; PLAN: r0=357(x), r1=148(y), r2=69(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 148
LDI r2, 69
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
