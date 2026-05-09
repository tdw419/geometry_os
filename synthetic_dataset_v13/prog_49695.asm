; DESCRIPTION: Renders a purple box of size 115x38 starting at (309, 96).
; PLAN: r0=309(x), r1=96(y), r2=115(width), r3=38(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 96
LDI r2, 115
LDI r3, 38
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
