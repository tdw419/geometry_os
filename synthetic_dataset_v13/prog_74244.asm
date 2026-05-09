; DESCRIPTION: Renders a purple box of size 10x77 starting at (335, 102).
; PLAN: r0=335(x), r1=102(y), r2=10(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 102
LDI r2, 10
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
