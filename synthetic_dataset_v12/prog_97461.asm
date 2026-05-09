; DESCRIPTION: Renders a purple box of size 24x102 starting at (53, 30).
; PLAN: r0=53(x), r1=30(y), r2=24(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 30
LDI r2, 24
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
