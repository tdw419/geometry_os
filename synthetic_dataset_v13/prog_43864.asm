; DESCRIPTION: Renders a purple box of size 25x97 starting at (290, 12).
; PLAN: r0=290(x), r1=12(y), r2=25(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 12
LDI r2, 25
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
