; DESCRIPTION: Renders a purple box of size 119x65 starting at (275, 72).
; PLAN: r0=275(x), r1=72(y), r2=119(width), r3=65(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 72
LDI r2, 119
LDI r3, 65
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
