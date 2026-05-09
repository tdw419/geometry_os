; DESCRIPTION: Renders a magenta box of size 35x119 starting at (70, 40).
; PLAN: r0=70(x), r1=40(y), r2=35(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 40
LDI r2, 35
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
