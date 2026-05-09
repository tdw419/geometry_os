; DESCRIPTION: Creates a purple rectangular region at (82, 3) spanning 28 by 60 pixels.
; PLAN: r0=82(x), r1=3(y), r2=28(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 3
LDI r2, 28
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
