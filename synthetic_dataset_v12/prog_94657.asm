; DESCRIPTION: Renders a purple box of size 62x102 starting at (220, 82).
; PLAN: r0=220(x), r1=82(y), r2=62(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 82
LDI r2, 62
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
