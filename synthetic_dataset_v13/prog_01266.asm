; DESCRIPTION: Renders a magenta box of size 89x99 starting at (382, 140).
; PLAN: r0=382(x), r1=140(y), r2=89(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 140
LDI r2, 89
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
