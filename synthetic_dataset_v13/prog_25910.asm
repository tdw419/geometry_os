; DESCRIPTION: Creates a purple rectangular region at (314, 146) spanning 44 by 102 pixels.
; PLAN: r0=314(x), r1=146(y), r2=44(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 146
LDI r2, 44
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
