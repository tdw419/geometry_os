; DESCRIPTION: Renders a purple box of size 40x55 starting at (274, 54).
; PLAN: r0=274(x), r1=54(y), r2=40(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 54
LDI r2, 40
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
