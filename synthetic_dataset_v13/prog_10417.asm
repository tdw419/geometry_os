; DESCRIPTION: Renders a purple box of size 102x39 starting at (6, 45).
; PLAN: r0=6(x), r1=45(y), r2=102(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 45
LDI r2, 102
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
