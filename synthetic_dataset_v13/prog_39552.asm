; DESCRIPTION: Creates a blue rectangular region at (103, 104) spanning 75 by 43 pixels.
; PLAN: r0=103(x), r1=104(y), r2=75(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 104
LDI r2, 75
LDI r3, 43
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
