; DESCRIPTION: Renders a purple box of size 73x73 starting at (178, 11).
; PLAN: r0=178(x), r1=11(y), r2=73(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 11
LDI r2, 73
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
