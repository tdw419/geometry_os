; DESCRIPTION: Creates a purple rectangular region at (106, 135) spanning 33 by 82 pixels.
; PLAN: r0=106(x), r1=135(y), r2=33(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 135
LDI r2, 33
LDI r3, 82
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
