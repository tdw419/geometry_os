; DESCRIPTION: Creates a purple rectangular region at (160, 172) spanning 99 by 19 pixels.
; PLAN: r0=160(x), r1=172(y), r2=99(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 172
LDI r2, 99
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
