; DESCRIPTION: Creates a purple rectangular region at (119, 27) spanning 56 by 47 pixels.
; PLAN: r0=119(x), r1=27(y), r2=56(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 27
LDI r2, 56
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
