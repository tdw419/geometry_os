; DESCRIPTION: Renders a purple box of size 94x43 starting at (107, 8).
; PLAN: r0=107(x), r1=8(y), r2=94(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 8
LDI r2, 94
LDI r3, 43
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
