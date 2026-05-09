; DESCRIPTION: Renders a purple box of size 105x35 starting at (218, 140).
; PLAN: r0=218(x), r1=140(y), r2=105(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 140
LDI r2, 105
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
