; DESCRIPTION: Creates a purple rectangular region at (30, 82) spanning 55 by 109 pixels.
; PLAN: r0=30(x), r1=82(y), r2=55(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 82
LDI r2, 55
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
