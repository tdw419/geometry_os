; DESCRIPTION: Renders a magenta box of size 102x17 starting at (315, 147).
; PLAN: r0=315(x), r1=147(y), r2=102(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 147
LDI r2, 102
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
