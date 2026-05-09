; DESCRIPTION: Creates a purple rectangular region at (353, 90) spanning 107 by 107 pixels.
; PLAN: r0=353(x), r1=90(y), r2=107(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 90
LDI r2, 107
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
