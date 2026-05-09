; DESCRIPTION: Renders a purple box of size 83x117 starting at (19, 128).
; PLAN: r0=19(x), r1=128(y), r2=83(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 128
LDI r2, 83
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
