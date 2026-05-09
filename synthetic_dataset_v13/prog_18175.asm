; DESCRIPTION: Creates a red rectangular region at (9, 119) spanning 82 by 110 pixels.
; PLAN: r0=9(x), r1=119(y), r2=82(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 119
LDI r2, 82
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
