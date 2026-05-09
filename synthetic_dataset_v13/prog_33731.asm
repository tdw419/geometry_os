; DESCRIPTION: Renders a blue box of size 104x92 starting at (264, 114).
; PLAN: r0=264(x), r1=114(y), r2=104(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 114
LDI r2, 104
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
