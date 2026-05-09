; DESCRIPTION: Creates a purple rectangular region at (382, 208) spanning 104 by 15 pixels.
; PLAN: r0=382(x), r1=208(y), r2=104(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 208
LDI r2, 104
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
