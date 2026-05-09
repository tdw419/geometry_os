; DESCRIPTION: Renders a magenta box of size 15x83 starting at (36, 102).
; PLAN: r0=36(x), r1=102(y), r2=15(width), r3=83(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 102
LDI r2, 15
LDI r3, 83
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
