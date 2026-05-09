; DESCRIPTION: Renders a blue box of size 85x66 starting at (15, 33).
; PLAN: r0=15(x), r1=33(y), r2=85(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 33
LDI r2, 85
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
