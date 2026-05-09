; DESCRIPTION: Renders a purple box of size 89x85 starting at (161, 33).
; PLAN: r0=161(x), r1=33(y), r2=89(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 33
LDI r2, 89
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
