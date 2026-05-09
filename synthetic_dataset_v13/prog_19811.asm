; DESCRIPTION: Creates a purple rectangular region at (375, 104) spanning 68 by 65 pixels.
; PLAN: r0=375(x), r1=104(y), r2=68(width), r3=65(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 104
LDI r2, 68
LDI r3, 65
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
