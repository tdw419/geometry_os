; DESCRIPTION: Renders a blue box of size 104x92 starting at (49, 57).
; PLAN: r0=49(x), r1=57(y), r2=104(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 57
LDI r2, 104
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
