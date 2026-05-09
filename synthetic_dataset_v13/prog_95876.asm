; DESCRIPTION: Creates a blue rectangular region at (399, 25) spanning 104 by 45 pixels.
; PLAN: r0=399(x), r1=25(y), r2=104(width), r3=45(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 25
LDI r2, 104
LDI r3, 45
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
