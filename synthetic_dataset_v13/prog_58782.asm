; DESCRIPTION: Creates a purple rectangular region at (137, 24) spanning 23 by 70 pixels.
; PLAN: r0=137(x), r1=24(y), r2=23(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 24
LDI r2, 23
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
