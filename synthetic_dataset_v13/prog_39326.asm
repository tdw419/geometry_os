; DESCRIPTION: Renders a purple box of size 112x28 starting at (63, 199).
; PLAN: r0=63(x), r1=199(y), r2=112(width), r3=28(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 199
LDI r2, 112
LDI r3, 28
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
