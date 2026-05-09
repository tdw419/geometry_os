; DESCRIPTION: Renders a magenta box of size 37x26 starting at (114, 119).
; PLAN: r0=114(x), r1=119(y), r2=37(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 119
LDI r2, 37
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
