; DESCRIPTION: Renders a magenta box of size 63x70 starting at (8, 25).
; PLAN: r0=8(x), r1=25(y), r2=63(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 25
LDI r2, 63
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
