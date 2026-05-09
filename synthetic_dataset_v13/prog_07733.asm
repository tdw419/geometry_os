; DESCRIPTION: Renders a purple box of size 98x79 starting at (283, 37).
; PLAN: r0=283(x), r1=37(y), r2=98(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 37
LDI r2, 98
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
