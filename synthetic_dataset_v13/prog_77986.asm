; DESCRIPTION: Renders a magenta box of size 44x11 starting at (132, 77).
; PLAN: r0=132(x), r1=77(y), r2=44(width), r3=11(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 77
LDI r2, 44
LDI r3, 11
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
