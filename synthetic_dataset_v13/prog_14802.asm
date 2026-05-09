; DESCRIPTION: Creates a purple rectangular region at (425, 82) spanning 85 by 86 pixels.
; PLAN: r0=425(x), r1=82(y), r2=85(width), r3=86(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 82
LDI r2, 85
LDI r3, 86
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
