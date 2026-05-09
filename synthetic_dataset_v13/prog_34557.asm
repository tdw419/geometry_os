; DESCRIPTION: Renders a magenta box of size 20x99 starting at (99, 68).
; PLAN: r0=99(x), r1=68(y), r2=20(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 68
LDI r2, 20
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
