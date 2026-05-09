; DESCRIPTION: Renders a purple box of size 69x108 starting at (367, 79).
; PLAN: r0=367(x), r1=79(y), r2=69(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 79
LDI r2, 69
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
