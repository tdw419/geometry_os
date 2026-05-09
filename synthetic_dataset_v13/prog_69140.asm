; DESCRIPTION: Renders a magenta box of size 29x44 starting at (391, 147).
; PLAN: r0=391(x), r1=147(y), r2=29(width), r3=44(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 147
LDI r2, 29
LDI r3, 44
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
