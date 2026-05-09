; DESCRIPTION: Renders a blue box of size 107x73 starting at (376, 124).
; PLAN: r0=376(x), r1=124(y), r2=107(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 124
LDI r2, 107
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
