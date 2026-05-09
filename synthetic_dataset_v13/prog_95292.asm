; DESCRIPTION: Creates a purple rectangular region at (207, 135) spanning 61 by 89 pixels.
; PLAN: r0=207(x), r1=135(y), r2=61(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 135
LDI r2, 61
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
