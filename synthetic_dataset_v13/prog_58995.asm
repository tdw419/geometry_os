; DESCRIPTION: Creates a purple rectangular region at (171, 158) spanning 82 by 48 pixels.
; PLAN: r0=171(x), r1=158(y), r2=82(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 158
LDI r2, 82
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
