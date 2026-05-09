; DESCRIPTION: Creates a white rectangular region at (118, 124) spanning 84 by 98 pixels.
; PLAN: r0=118(x), r1=124(y), r2=84(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 124
LDI r2, 84
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
