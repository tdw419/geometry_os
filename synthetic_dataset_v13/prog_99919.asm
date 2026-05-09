; DESCRIPTION: Renders a blue box of size 92x71 starting at (186, 179).
; PLAN: r0=186(x), r1=179(y), r2=92(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 179
LDI r2, 92
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
