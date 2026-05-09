; DESCRIPTION: Renders a magenta box of size 96x36 starting at (364, 25).
; PLAN: r0=364(x), r1=25(y), r2=96(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 25
LDI r2, 96
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
