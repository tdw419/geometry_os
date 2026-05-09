; DESCRIPTION: Renders a purple box of size 33x82 starting at (89, 102).
; PLAN: r0=89(x), r1=102(y), r2=33(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 102
LDI r2, 33
LDI r3, 82
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
