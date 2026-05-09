; DESCRIPTION: Creates a purple rectangular region at (191, 23) spanning 44 by 18 pixels.
; PLAN: r0=191(x), r1=23(y), r2=44(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 23
LDI r2, 44
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
