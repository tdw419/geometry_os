; DESCRIPTION: Renders a purple box of size 94x21 starting at (97, 172).
; PLAN: r0=97(x), r1=172(y), r2=94(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 172
LDI r2, 94
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
