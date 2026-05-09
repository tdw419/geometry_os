; DESCRIPTION: Creates a purple rectangular region at (309, 3) spanning 104 by 17 pixels.
; PLAN: r0=309(x), r1=3(y), r2=104(width), r3=17(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 3
LDI r2, 104
LDI r3, 17
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
