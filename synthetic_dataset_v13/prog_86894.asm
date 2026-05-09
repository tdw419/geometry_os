; DESCRIPTION: Renders a blue box of size 113x60 starting at (51, 8).
; PLAN: r0=51(x), r1=8(y), r2=113(width), r3=60(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 8
LDI r2, 113
LDI r3, 60
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
