; DESCRIPTION: Renders a purple box of size 37x95 starting at (92, 119).
; PLAN: r0=92(x), r1=119(y), r2=37(width), r3=95(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 119
LDI r2, 37
LDI r3, 95
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
