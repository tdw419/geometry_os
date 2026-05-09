; DESCRIPTION: Renders a purple box of size 114x87 starting at (208, 9).
; PLAN: r0=208(x), r1=9(y), r2=114(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 9
LDI r2, 114
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
