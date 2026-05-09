; DESCRIPTION: Creates a purple rectangular region at (111, 104) spanning 105 by 113 pixels.
; PLAN: r0=111(x), r1=104(y), r2=105(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 104
LDI r2, 105
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
