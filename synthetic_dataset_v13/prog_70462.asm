; DESCRIPTION: Renders a blue box of size 59x93 starting at (440, 84).
; PLAN: r0=440(x), r1=84(y), r2=59(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 84
LDI r2, 59
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
