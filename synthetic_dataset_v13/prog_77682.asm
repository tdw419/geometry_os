; DESCRIPTION: Renders a magenta box of size 101x40 starting at (236, 66).
; PLAN: r0=236(x), r1=66(y), r2=101(width), r3=40(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 66
LDI r2, 101
LDI r3, 40
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
