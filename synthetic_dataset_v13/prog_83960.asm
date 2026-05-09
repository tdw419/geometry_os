; DESCRIPTION: Creates a purple rectangular region at (175, 171) spanning 49 by 14 pixels.
; PLAN: r0=175(x), r1=171(y), r2=49(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 171
LDI r2, 49
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
