; DESCRIPTION: Renders a purple box of size 23x44 starting at (290, 127).
; PLAN: r0=290(x), r1=127(y), r2=23(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 127
LDI r2, 23
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
