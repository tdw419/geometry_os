; DESCRIPTION: Renders a blue box of size 70x104 starting at (322, 34).
; PLAN: r0=322(x), r1=34(y), r2=70(width), r3=104(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 34
LDI r2, 70
LDI r3, 104
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
