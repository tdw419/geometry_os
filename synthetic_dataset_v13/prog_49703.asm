; DESCRIPTION: Renders a purple box of size 108x22 starting at (196, 76).
; PLAN: r0=196(x), r1=76(y), r2=108(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 76
LDI r2, 108
LDI r3, 22
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
