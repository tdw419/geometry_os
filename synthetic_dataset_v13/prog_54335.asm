; DESCRIPTION: Renders a purple box of size 36x63 starting at (248, 121).
; PLAN: r0=248(x), r1=121(y), r2=36(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 121
LDI r2, 36
LDI r3, 63
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
