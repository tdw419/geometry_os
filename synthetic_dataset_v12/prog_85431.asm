; DESCRIPTION: Creates a red rectangular region at (44, 31) spanning 18 by 75 pixels.
; PLAN: r0=44(x), r1=31(y), r2=18(width), r3=75(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 31
LDI r2, 18
LDI r3, 75
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
