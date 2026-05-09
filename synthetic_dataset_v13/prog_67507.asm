; DESCRIPTION: Creates a blue rectangular region at (159, 81) spanning 35 by 104 pixels.
; PLAN: r0=159(x), r1=81(y), r2=35(width), r3=104(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 81
LDI r2, 35
LDI r3, 104
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
