; DESCRIPTION: Renders a purple box of size 29x45 starting at (204, 71).
; PLAN: r0=204(x), r1=71(y), r2=29(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 71
LDI r2, 29
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
