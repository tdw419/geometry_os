; DESCRIPTION: Renders a purple box of size 55x78 starting at (393, 124).
; PLAN: r0=393(x), r1=124(y), r2=55(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 124
LDI r2, 55
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
