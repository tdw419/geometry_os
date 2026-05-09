; DESCRIPTION: Renders a purple box of size 31x48 starting at (9, 71).
; PLAN: r0=9(x), r1=71(y), r2=31(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 71
LDI r2, 31
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
