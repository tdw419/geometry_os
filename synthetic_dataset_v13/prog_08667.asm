; DESCRIPTION: Renders a purple box of size 37x102 starting at (364, 92).
; PLAN: r0=364(x), r1=92(y), r2=37(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 92
LDI r2, 37
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
