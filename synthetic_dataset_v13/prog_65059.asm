; DESCRIPTION: Renders a blue box of size 10x55 starting at (127, 76).
; PLAN: r0=127(x), r1=76(y), r2=10(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 76
LDI r2, 10
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
