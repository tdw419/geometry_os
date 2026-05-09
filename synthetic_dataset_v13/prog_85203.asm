; DESCRIPTION: Renders a purple box of size 60x79 starting at (290, 59).
; PLAN: r0=290(x), r1=59(y), r2=60(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 59
LDI r2, 60
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
