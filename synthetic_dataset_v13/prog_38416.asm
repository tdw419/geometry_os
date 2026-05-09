; DESCRIPTION: Creates a white rectangular region at (139, 124) spanning 66 by 82 pixels.
; PLAN: r0=139(x), r1=124(y), r2=66(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 124
LDI r2, 66
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
