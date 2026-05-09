; DESCRIPTION: Creates a purple rectangular region at (152, 151) spanning 22 by 76 pixels.
; PLAN: r0=152(x), r1=151(y), r2=22(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 151
LDI r2, 22
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
