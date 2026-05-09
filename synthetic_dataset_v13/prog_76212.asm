; DESCRIPTION: Renders a purple box of size 111x78 starting at (355, 90).
; PLAN: r0=355(x), r1=90(y), r2=111(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 90
LDI r2, 111
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
