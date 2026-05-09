; DESCRIPTION: Creates a blue rectangular region at (47, 135) spanning 19 by 117 pixels.
; PLAN: r0=47(x), r1=135(y), r2=19(width), r3=117(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 135
LDI r2, 19
LDI r3, 117
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
