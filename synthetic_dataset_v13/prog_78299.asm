; DESCRIPTION: Renders a purple box of size 58x62 starting at (38, 140).
; PLAN: r0=38(x), r1=140(y), r2=58(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 140
LDI r2, 58
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
