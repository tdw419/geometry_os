; DESCRIPTION: Creates a purple rectangular region at (50, 115) spanning 74 by 104 pixels.
; PLAN: r0=50(x), r1=115(y), r2=74(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 115
LDI r2, 74
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
