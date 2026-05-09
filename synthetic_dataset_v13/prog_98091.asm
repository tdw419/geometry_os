; DESCRIPTION: Creates a purple rectangular region at (163, 117) spanning 54 by 77 pixels.
; PLAN: r0=163(x), r1=117(y), r2=54(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 117
LDI r2, 54
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
