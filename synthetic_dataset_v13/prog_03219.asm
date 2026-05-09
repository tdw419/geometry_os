; DESCRIPTION: Creates a purple rectangular region at (39, 38) spanning 66 by 80 pixels.
; PLAN: r0=39(x), r1=38(y), r2=66(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 38
LDI r2, 66
LDI r3, 80
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
