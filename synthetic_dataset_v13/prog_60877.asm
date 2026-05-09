; DESCRIPTION: Renders a purple box of size 52x55 starting at (441, 26).
; PLAN: r0=441(x), r1=26(y), r2=52(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 26
LDI r2, 52
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
