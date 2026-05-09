; DESCRIPTION: Creates a purple rectangular region at (116, 146) spanning 40 by 70 pixels.
; PLAN: r0=116(x), r1=146(y), r2=40(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 146
LDI r2, 40
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
