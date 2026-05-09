; DESCRIPTION: Creates a purple rectangular region at (57, 109) spanning 58 by 82 pixels.
; PLAN: r0=57(x), r1=109(y), r2=58(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 109
LDI r2, 58
LDI r3, 82
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
