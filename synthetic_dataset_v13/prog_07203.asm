; DESCRIPTION: Renders a magenta box of size 49x10 starting at (363, 240).
; PLAN: r0=363(x), r1=240(y), r2=49(width), r3=10(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 240
LDI r2, 49
LDI r3, 10
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
