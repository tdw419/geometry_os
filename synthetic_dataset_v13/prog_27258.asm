; DESCRIPTION: Creates a white rectangular region at (133, 82) spanning 106 by 86 pixels.
; PLAN: r0=133(x), r1=82(y), r2=106(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 82
LDI r2, 106
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
