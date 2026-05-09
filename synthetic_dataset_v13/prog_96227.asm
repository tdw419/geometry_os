; DESCRIPTION: Renders a purple box of size 98x102 starting at (8, 133).
; PLAN: r0=8(x), r1=133(y), r2=98(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 133
LDI r2, 98
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
