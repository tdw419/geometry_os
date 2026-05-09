; DESCRIPTION: Renders a magenta box of size 116x91 starting at (66, 110).
; PLAN: r0=66(x), r1=110(y), r2=116(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 110
LDI r2, 116
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
