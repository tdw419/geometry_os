; DESCRIPTION: Renders a purple box of size 119x76 starting at (300, 89).
; PLAN: r0=300(x), r1=89(y), r2=119(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 89
LDI r2, 119
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
