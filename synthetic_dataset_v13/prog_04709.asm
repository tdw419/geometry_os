; DESCRIPTION: Renders a blue box of size 57x84 starting at (178, 148).
; PLAN: r0=178(x), r1=148(y), r2=57(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 148
LDI r2, 57
LDI r3, 84
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
