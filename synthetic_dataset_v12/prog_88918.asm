; DESCRIPTION: Renders a purple box of size 77x40 starting at (92, 54).
; PLAN: r0=92(x), r1=54(y), r2=77(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 54
LDI r2, 77
LDI r3, 40
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
