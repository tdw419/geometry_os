; DESCRIPTION: Creates a purple rectangular region at (24, 82) spanning 91 by 82 pixels.
; PLAN: r0=24(x), r1=82(y), r2=91(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 82
LDI r2, 91
LDI r3, 82
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
