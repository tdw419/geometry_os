; DESCRIPTION: Renders a purple box of size 19x48 starting at (409, 102).
; PLAN: r0=409(x), r1=102(y), r2=19(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 102
LDI r2, 19
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
