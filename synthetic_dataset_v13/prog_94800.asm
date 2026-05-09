; DESCRIPTION: Renders a magenta box of size 31x49 starting at (431, 44).
; PLAN: r0=431(x), r1=44(y), r2=31(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 44
LDI r2, 31
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
