; DESCRIPTION: Creates a purple rectangular region at (171, 151) spanning 82 by 37 pixels.
; PLAN: r0=171(x), r1=151(y), r2=82(width), r3=37(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 151
LDI r2, 82
LDI r3, 37
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
