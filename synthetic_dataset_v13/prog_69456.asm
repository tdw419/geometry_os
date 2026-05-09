; DESCRIPTION: Renders a purple box of size 111x66 starting at (101, 39).
; PLAN: r0=101(x), r1=39(y), r2=111(width), r3=66(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 39
LDI r2, 111
LDI r3, 66
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
