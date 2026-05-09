; DESCRIPTION: Creates a purple rectangular region at (321, 117) spanning 67 by 31 pixels.
; PLAN: r0=321(x), r1=117(y), r2=67(width), r3=31(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 117
LDI r2, 67
LDI r3, 31
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
