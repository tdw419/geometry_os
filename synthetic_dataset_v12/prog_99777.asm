; DESCRIPTION: Creates a purple rectangular region at (377, 71) spanning 103 by 14 pixels.
; PLAN: r0=377(x), r1=71(y), r2=103(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 71
LDI r2, 103
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
