; DESCRIPTION: Renders a purple box of size 90x31 starting at (349, 87).
; PLAN: r0=349(x), r1=87(y), r2=90(width), r3=31(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 87
LDI r2, 90
LDI r3, 31
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
