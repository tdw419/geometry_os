; DESCRIPTION: Renders a purple box of size 80x23 starting at (364, 87).
; PLAN: r0=364(x), r1=87(y), r2=80(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 87
LDI r2, 80
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
