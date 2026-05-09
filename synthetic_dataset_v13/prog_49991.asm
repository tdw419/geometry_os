; DESCRIPTION: Creates a purple rectangular region at (174, 14) spanning 102 by 83 pixels.
; PLAN: r0=174(x), r1=14(y), r2=102(width), r3=83(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 14
LDI r2, 102
LDI r3, 83
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
