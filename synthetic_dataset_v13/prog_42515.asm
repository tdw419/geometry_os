; DESCRIPTION: Renders a blue box of size 120x72 starting at (134, 155).
; PLAN: r0=134(x), r1=155(y), r2=120(width), r3=72(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 155
LDI r2, 120
LDI r3, 72
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
