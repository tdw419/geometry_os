; DESCRIPTION: Renders a purple box of size 99x48 starting at (389, 77).
; PLAN: r0=389(x), r1=77(y), r2=99(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 77
LDI r2, 99
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
