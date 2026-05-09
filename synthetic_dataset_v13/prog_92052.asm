; DESCRIPTION: Creates a purple rectangular region at (318, 23) spanning 109 by 23 pixels.
; PLAN: r0=318(x), r1=23(y), r2=109(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 23
LDI r2, 109
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
