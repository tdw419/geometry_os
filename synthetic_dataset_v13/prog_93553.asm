; DESCRIPTION: Renders a purple box of size 20x27 starting at (378, 102).
; PLAN: r0=378(x), r1=102(y), r2=20(width), r3=27(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 102
LDI r2, 20
LDI r3, 27
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
