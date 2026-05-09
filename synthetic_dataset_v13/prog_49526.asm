; DESCRIPTION: Renders a purple box of size 102x66 starting at (134, 124).
; PLAN: r0=134(x), r1=124(y), r2=102(width), r3=66(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 124
LDI r2, 102
LDI r3, 66
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
