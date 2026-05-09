; DESCRIPTION: Renders a magenta box of size 86x36 starting at (381, 185).
; PLAN: r0=381(x), r1=185(y), r2=86(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 185
LDI r2, 86
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
