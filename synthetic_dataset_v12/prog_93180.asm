; DESCRIPTION: Creates a purple rectangular region at (266, 72) spanning 91 by 96 pixels.
; PLAN: r0=266(x), r1=72(y), r2=91(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 72
LDI r2, 91
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
