; DESCRIPTION: Renders a purple box of size 98x98 starting at (386, 97).
; PLAN: r0=386(x), r1=97(y), r2=98(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 97
LDI r2, 98
LDI r3, 98
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
