; DESCRIPTION: Renders a blue box of size 109x33 starting at (21, 119).
; PLAN: r0=21(x), r1=119(y), r2=109(width), r3=33(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 119
LDI r2, 109
LDI r3, 33
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
