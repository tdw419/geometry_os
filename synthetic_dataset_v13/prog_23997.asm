; DESCRIPTION: Renders a purple box of size 71x97 starting at (193, 43).
; PLAN: r0=193(x), r1=43(y), r2=71(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 43
LDI r2, 71
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
