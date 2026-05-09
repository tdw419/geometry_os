; DESCRIPTION: Renders a magenta box of size 80x22 starting at (144, 3).
; PLAN: r0=144(x), r1=3(y), r2=80(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 3
LDI r2, 80
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
