; DESCRIPTION: Creates a purple rectangular region at (82, 204) spanning 119 by 24 pixels.
; PLAN: r0=82(x), r1=204(y), r2=119(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 204
LDI r2, 119
LDI r3, 24
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
