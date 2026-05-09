; DESCRIPTION: Renders a blue box of size 119x59 starting at (186, 19).
; PLAN: r0=186(x), r1=19(y), r2=119(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 19
LDI r2, 119
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
