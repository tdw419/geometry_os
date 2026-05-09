; DESCRIPTION: Creates a purple rectangular region at (38, 87) spanning 46 by 55 pixels.
; PLAN: r0=38(x), r1=87(y), r2=46(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 87
LDI r2, 46
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
