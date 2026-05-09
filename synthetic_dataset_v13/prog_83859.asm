; DESCRIPTION: Renders a magenta box of size 43x91 starting at (248, 102).
; PLAN: r0=248(x), r1=102(y), r2=43(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 102
LDI r2, 43
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
