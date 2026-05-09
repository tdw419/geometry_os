; DESCRIPTION: Renders a purple box of size 60x99 starting at (443, 106).
; PLAN: r0=443(x), r1=106(y), r2=60(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 106
LDI r2, 60
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
