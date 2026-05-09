; DESCRIPTION: Renders a blue box of size 90x76 starting at (150, 69).
; PLAN: r0=150(x), r1=69(y), r2=90(width), r3=76(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 69
LDI r2, 90
LDI r3, 76
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
