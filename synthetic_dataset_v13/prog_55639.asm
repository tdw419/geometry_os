; DESCRIPTION: Renders a purple box of size 83x11 starting at (244, 35).
; PLAN: r0=244(x), r1=35(y), r2=83(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 35
LDI r2, 83
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
