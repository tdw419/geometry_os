; DESCRIPTION: Renders a blue box of size 79x103 starting at (108, 43).
; PLAN: r0=108(x), r1=43(y), r2=79(width), r3=103(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 43
LDI r2, 79
LDI r3, 103
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
