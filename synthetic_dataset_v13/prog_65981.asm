; DESCRIPTION: Renders a blue box of size 35x12 starting at (76, 120).
; PLAN: r0=76(x), r1=120(y), r2=35(width), r3=12(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 120
LDI r2, 35
LDI r3, 12
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
