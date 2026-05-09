; DESCRIPTION: Renders a blue box of size 55x104 starting at (457, 68).
; PLAN: r0=457(x), r1=68(y), r2=55(width), r3=104(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 68
LDI r2, 55
LDI r3, 104
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
