; DESCRIPTION: Renders a purple box of size 13x24 starting at (157, 78).
; PLAN: r0=157(x), r1=78(y), r2=13(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 78
LDI r2, 13
LDI r3, 24
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
