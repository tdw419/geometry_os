; DESCRIPTION: Renders a blue box of size 51x50 starting at (270, 167).
; PLAN: r0=270(x), r1=167(y), r2=51(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 167
LDI r2, 51
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
