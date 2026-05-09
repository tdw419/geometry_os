; DESCRIPTION: Renders a purple box of size 63x77 starting at (199, 127).
; PLAN: r0=199(x), r1=127(y), r2=63(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 127
LDI r2, 63
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
