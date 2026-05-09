; DESCRIPTION: Renders a purple box of size 111x97 starting at (252, 158).
; PLAN: r0=252(x), r1=158(y), r2=111(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 158
LDI r2, 111
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
