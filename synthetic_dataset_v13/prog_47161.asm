; DESCRIPTION: Creates a red rectangular region at (44, 83) spanning 30 by 79 pixels.
; PLAN: r0=44(x), r1=83(y), r2=30(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 83
LDI r2, 30
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
