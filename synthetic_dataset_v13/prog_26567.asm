; DESCRIPTION: Creates a purple rectangular region at (87, 198) spanning 46 by 56 pixels.
; PLAN: r0=87(x), r1=198(y), r2=46(width), r3=56(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 198
LDI r2, 46
LDI r3, 56
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
