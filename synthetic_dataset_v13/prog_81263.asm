; DESCRIPTION: Renders a blue box of size 74x43 starting at (50, 134).
; PLAN: r0=50(x), r1=134(y), r2=74(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 134
LDI r2, 74
LDI r3, 43
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
