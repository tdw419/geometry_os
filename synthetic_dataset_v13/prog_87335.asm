; DESCRIPTION: Renders a purple box of size 46x76 starting at (455, 148).
; PLAN: r0=455(x), r1=148(y), r2=46(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 148
LDI r2, 46
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
