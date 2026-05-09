; DESCRIPTION: Renders a purple box of size 43x44 starting at (140, 73).
; PLAN: r0=140(x), r1=73(y), r2=43(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 73
LDI r2, 43
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
