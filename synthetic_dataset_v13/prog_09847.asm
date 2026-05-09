; DESCRIPTION: Renders a blue box of size 75x72 starting at (30, 26).
; PLAN: r0=30(x), r1=26(y), r2=75(width), r3=72(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 26
LDI r2, 75
LDI r3, 72
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
