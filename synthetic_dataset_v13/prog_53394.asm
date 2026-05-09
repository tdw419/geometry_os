; DESCRIPTION: Renders a blue box of size 84x93 starting at (264, 12).
; PLAN: r0=264(x), r1=12(y), r2=84(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 12
LDI r2, 84
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
