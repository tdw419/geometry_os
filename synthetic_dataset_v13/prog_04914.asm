; DESCRIPTION: Creates a purple rectangular region at (288, 82) spanning 107 by 110 pixels.
; PLAN: r0=288(x), r1=82(y), r2=107(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 82
LDI r2, 107
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
