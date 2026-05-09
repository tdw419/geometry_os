; DESCRIPTION: Renders a blue box of size 83x104 starting at (55, 28).
; PLAN: r0=55(x), r1=28(y), r2=83(width), r3=104(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 28
LDI r2, 83
LDI r3, 104
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
