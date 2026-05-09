; DESCRIPTION: Renders a blue box of size 25x66 starting at (24, 60).
; PLAN: r0=24(x), r1=60(y), r2=25(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 60
LDI r2, 25
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
