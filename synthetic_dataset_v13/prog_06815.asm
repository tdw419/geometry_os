; DESCRIPTION: Renders a blue box of size 92x79 starting at (329, 104).
; PLAN: r0=329(x), r1=104(y), r2=92(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 104
LDI r2, 92
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
