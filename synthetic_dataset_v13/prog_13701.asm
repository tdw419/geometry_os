; DESCRIPTION: Renders a blue box of size 115x80 starting at (52, 103).
; PLAN: r0=52(x), r1=103(y), r2=115(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 103
LDI r2, 115
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
