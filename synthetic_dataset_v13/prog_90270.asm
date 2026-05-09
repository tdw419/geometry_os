; DESCRIPTION: Creates a purple rectangular region at (321, 159) spanning 104 by 96 pixels.
; PLAN: r0=321(x), r1=159(y), r2=104(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 159
LDI r2, 104
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
