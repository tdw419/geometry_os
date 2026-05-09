; DESCRIPTION: Renders a magenta box of size 97x119 starting at (210, 0).
; PLAN: r0=210(x), r1=0(y), r2=97(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 0
LDI r2, 97
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
