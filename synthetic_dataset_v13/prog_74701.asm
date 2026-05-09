; DESCRIPTION: Renders a magenta box of size 86x106 starting at (408, 23).
; PLAN: r0=408(x), r1=23(y), r2=86(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 23
LDI r2, 86
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
