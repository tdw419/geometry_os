; DESCRIPTION: Renders a purple box of size 92x62 starting at (181, 169).
; PLAN: r0=181(x), r1=169(y), r2=92(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 169
LDI r2, 92
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
