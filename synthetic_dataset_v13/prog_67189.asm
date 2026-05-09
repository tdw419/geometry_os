; DESCRIPTION: Renders a blue box of size 102x92 starting at (186, 28).
; PLAN: r0=186(x), r1=28(y), r2=102(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 28
LDI r2, 102
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
