; DESCRIPTION: Renders a purple box of size 99x79 starting at (329, 74).
; PLAN: r0=329(x), r1=74(y), r2=99(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 74
LDI r2, 99
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
