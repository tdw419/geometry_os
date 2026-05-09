; DESCRIPTION: Renders a magenta box of size 63x109 starting at (106, 99).
; PLAN: r0=106(x), r1=99(y), r2=63(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 99
LDI r2, 63
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
