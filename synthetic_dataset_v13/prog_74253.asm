; DESCRIPTION: Renders a purple box of size 27x97 starting at (353, 90).
; PLAN: r0=353(x), r1=90(y), r2=27(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 90
LDI r2, 27
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
