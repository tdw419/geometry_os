; DESCRIPTION: Creates a blue rectangular region at (126, 40) spanning 47 by 104 pixels.
; PLAN: r0=126(x), r1=40(y), r2=47(width), r3=104(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 40
LDI r2, 47
LDI r3, 104
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
