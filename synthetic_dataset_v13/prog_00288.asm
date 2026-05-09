; DESCRIPTION: Creates a purple rectangular region at (352, 234) spanning 99 by 21 pixels.
; PLAN: r0=352(x), r1=234(y), r2=99(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 234
LDI r2, 99
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
