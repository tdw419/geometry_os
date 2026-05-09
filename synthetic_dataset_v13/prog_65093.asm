; DESCRIPTION: Renders a blue box of size 31x112 starting at (436, 54).
; PLAN: r0=436(x), r1=54(y), r2=31(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 54
LDI r2, 31
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
