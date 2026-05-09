; DESCRIPTION: Creates a purple rectangular region at (0, 234) spanning 44 by 19 pixels.
; PLAN: r0=0(x), r1=234(y), r2=44(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 234
LDI r2, 44
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
