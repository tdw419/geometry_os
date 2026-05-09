; DESCRIPTION: Creates a purple rectangular region at (246, 93) spanning 56 by 107 pixels.
; PLAN: r0=246(x), r1=93(y), r2=56(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 93
LDI r2, 56
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
