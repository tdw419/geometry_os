; DESCRIPTION: Renders a blue box of size 55x106 starting at (148, 45).
; PLAN: r0=148(x), r1=45(y), r2=55(width), r3=106(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 45
LDI r2, 55
LDI r3, 106
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
