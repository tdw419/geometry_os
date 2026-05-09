; DESCRIPTION: Creates a purple rectangular region at (13, 132) spanning 109 by 46 pixels.
; PLAN: r0=13(x), r1=132(y), r2=109(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 132
LDI r2, 109
LDI r3, 46
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
