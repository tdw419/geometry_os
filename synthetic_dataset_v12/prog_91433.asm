; DESCRIPTION: Renders a magenta box of size 24x80 starting at (132, 31).
; PLAN: r0=132(x), r1=31(y), r2=24(width), r3=80(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 31
LDI r2, 24
LDI r3, 80
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
