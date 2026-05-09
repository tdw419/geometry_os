; DESCRIPTION: Creates a purple rectangular region at (105, 27) spanning 31 by 22 pixels.
; PLAN: r0=105(x), r1=27(y), r2=31(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 27
LDI r2, 31
LDI r3, 22
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
