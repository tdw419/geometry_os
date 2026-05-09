; DESCRIPTION: Renders a magenta box of size 15x14 starting at (266, 129).
; PLAN: r0=266(x), r1=129(y), r2=15(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 129
LDI r2, 15
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
