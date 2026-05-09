; DESCRIPTION: Renders a blue box of size 40x117 starting at (226, 23).
; PLAN: r0=226(x), r1=23(y), r2=40(width), r3=117(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 23
LDI r2, 40
LDI r3, 117
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
