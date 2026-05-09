; DESCRIPTION: Creates a purple rectangular region at (221, 178) spanning 85 by 22 pixels.
; PLAN: r0=221(x), r1=178(y), r2=85(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 178
LDI r2, 85
LDI r3, 22
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
