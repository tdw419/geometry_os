; DESCRIPTION: Renders a blue box of size 72x71 starting at (185, 3).
; PLAN: r0=185(x), r1=3(y), r2=72(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 3
LDI r2, 72
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
