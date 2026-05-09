; DESCRIPTION: Renders a purple box of size 91x75 starting at (133, 68).
; PLAN: r0=133(x), r1=68(y), r2=91(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 68
LDI r2, 91
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
