; DESCRIPTION: Renders a purple box of size 93x97 starting at (148, 33).
; PLAN: r0=148(x), r1=33(y), r2=93(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 33
LDI r2, 93
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
