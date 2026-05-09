; DESCRIPTION: Renders a purple box of size 60x98 starting at (95, 33).
; PLAN: r0=95(x), r1=33(y), r2=60(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 33
LDI r2, 60
LDI r3, 98
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
