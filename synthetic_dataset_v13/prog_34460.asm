; DESCRIPTION: Creates a purple rectangular region at (243, 97) spanning 33 by 114 pixels.
; PLAN: r0=243(x), r1=97(y), r2=33(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 97
LDI r2, 33
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
