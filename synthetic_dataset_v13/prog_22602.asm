; DESCRIPTION: Renders a blue box of size 81x93 starting at (239, 148).
; PLAN: r0=239(x), r1=148(y), r2=81(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 148
LDI r2, 81
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
