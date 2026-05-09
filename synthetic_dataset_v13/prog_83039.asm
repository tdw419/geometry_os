; DESCRIPTION: Renders a purple box of size 94x66 starting at (156, 52).
; PLAN: r0=156(x), r1=52(y), r2=94(width), r3=66(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 52
LDI r2, 94
LDI r3, 66
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
