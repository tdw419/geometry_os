; DESCRIPTION: Creates a blue rectangular region at (344, 35) spanning 73 by 117 pixels.
; PLAN: r0=344(x), r1=35(y), r2=73(width), r3=117(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 35
LDI r2, 73
LDI r3, 117
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
