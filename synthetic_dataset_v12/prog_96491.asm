; DESCRIPTION: Creates a purple rectangular region at (469, 152) spanning 13 by 39 pixels.
; PLAN: r0=469(x), r1=152(y), r2=13(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 152
LDI r2, 13
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
