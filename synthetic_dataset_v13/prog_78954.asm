; DESCRIPTION: Renders a purple box of size 31x117 starting at (232, 108).
; PLAN: r0=232(x), r1=108(y), r2=31(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 108
LDI r2, 31
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
