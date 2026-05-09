; DESCRIPTION: Renders a purple box of size 44x46 starting at (149, 120).
; PLAN: r0=149(x), r1=120(y), r2=44(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 120
LDI r2, 44
LDI r3, 46
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
