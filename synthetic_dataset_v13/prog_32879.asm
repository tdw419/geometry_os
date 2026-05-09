; DESCRIPTION: Renders a blue box of size 104x31 starting at (4, 80).
; PLAN: r0=4(x), r1=80(y), r2=104(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 80
LDI r2, 104
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
