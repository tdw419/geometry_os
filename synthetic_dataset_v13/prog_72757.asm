; DESCRIPTION: Renders a blue box of size 72x106 starting at (425, 124).
; PLAN: r0=425(x), r1=124(y), r2=72(width), r3=106(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 124
LDI r2, 72
LDI r3, 106
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
