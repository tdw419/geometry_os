; DESCRIPTION: Renders a purple box of size 52x79 starting at (70, 124).
; PLAN: r0=70(x), r1=124(y), r2=52(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 124
LDI r2, 52
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
