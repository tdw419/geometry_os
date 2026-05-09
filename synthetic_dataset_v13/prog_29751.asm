; DESCRIPTION: Creates a purple rectangular region at (278, 68) spanning 47 by 116 pixels.
; PLAN: r0=278(x), r1=68(y), r2=47(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 68
LDI r2, 47
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
