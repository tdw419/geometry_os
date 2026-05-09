; DESCRIPTION: Renders a purple box of size 97x109 starting at (23, 140).
; PLAN: r0=23(x), r1=140(y), r2=97(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 140
LDI r2, 97
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
