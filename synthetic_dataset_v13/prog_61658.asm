; DESCRIPTION: Renders a purple box of size 97x23 starting at (319, 186).
; PLAN: r0=319(x), r1=186(y), r2=97(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 186
LDI r2, 97
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
