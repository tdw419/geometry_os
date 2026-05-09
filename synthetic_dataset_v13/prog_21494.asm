; DESCRIPTION: Creates a purple rectangular region at (398, 194) spanning 43 by 55 pixels.
; PLAN: r0=398(x), r1=194(y), r2=43(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 194
LDI r2, 43
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
