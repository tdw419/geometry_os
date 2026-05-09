; DESCRIPTION: Creates a purple rectangular region at (360, 107) spanning 67 by 110 pixels.
; PLAN: r0=360(x), r1=107(y), r2=67(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 107
LDI r2, 67
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
