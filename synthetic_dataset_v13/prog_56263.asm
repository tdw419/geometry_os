; DESCRIPTION: Renders a purple box of size 59x76 starting at (132, 91).
; PLAN: r0=132(x), r1=91(y), r2=59(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 91
LDI r2, 59
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
