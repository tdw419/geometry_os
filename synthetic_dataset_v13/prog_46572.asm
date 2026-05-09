; DESCRIPTION: Renders a purple box of size 13x106 starting at (187, 33).
; PLAN: r0=187(x), r1=33(y), r2=13(width), r3=106(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 33
LDI r2, 13
LDI r3, 106
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
