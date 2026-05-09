; DESCRIPTION: Renders a purple box of size 26x87 starting at (220, 159).
; PLAN: r0=220(x), r1=159(y), r2=26(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 159
LDI r2, 26
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
