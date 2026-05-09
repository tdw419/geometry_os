; DESCRIPTION: Creates a white rectangular region at (212, 80) spanning 49 by 82 pixels.
; PLAN: r0=212(x), r1=80(y), r2=49(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 80
LDI r2, 49
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
