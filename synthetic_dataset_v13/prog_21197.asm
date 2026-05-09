; DESCRIPTION: Renders a magenta box of size 66x57 starting at (390, 19).
; PLAN: r0=390(x), r1=19(y), r2=66(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 19
LDI r2, 66
LDI r3, 57
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
