; DESCRIPTION: Renders a purple box of size 111x43 starting at (219, 177).
; PLAN: r0=219(x), r1=177(y), r2=111(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 177
LDI r2, 111
LDI r3, 43
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
