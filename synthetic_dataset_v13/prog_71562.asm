; DESCRIPTION: Renders a blue box of size 19x50 starting at (145, 161).
; PLAN: r0=145(x), r1=161(y), r2=19(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 161
LDI r2, 19
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
