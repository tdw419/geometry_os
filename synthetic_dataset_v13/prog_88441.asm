; DESCRIPTION: Renders a blue box of size 71x94 starting at (335, 15).
; PLAN: r0=335(x), r1=15(y), r2=71(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 15
LDI r2, 71
LDI r3, 94
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
