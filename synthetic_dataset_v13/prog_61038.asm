; DESCRIPTION: Renders a blue box of size 65x44 starting at (100, 10).
; PLAN: r0=100(x), r1=10(y), r2=65(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 10
LDI r2, 65
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
