; DESCRIPTION: Renders a magenta box of size 95x119 starting at (328, 77).
; PLAN: r0=328(x), r1=77(y), r2=95(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 77
LDI r2, 95
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
