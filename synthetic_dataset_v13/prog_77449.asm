; DESCRIPTION: Creates a purple rectangular region at (30, 82) spanning 32 by 35 pixels.
; PLAN: r0=30(x), r1=82(y), r2=32(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 82
LDI r2, 32
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
