; DESCRIPTION: Creates a purple rectangular region at (117, 188) spanning 57 by 22 pixels.
; PLAN: r0=117(x), r1=188(y), r2=57(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 188
LDI r2, 57
LDI r3, 22
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
