; DESCRIPTION: Creates a purple rectangular region at (82, 60) spanning 81 by 52 pixels.
; PLAN: r0=82(x), r1=60(y), r2=81(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 60
LDI r2, 81
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
