; DESCRIPTION: Creates a white rectangular region at (75, 83) spanning 29 by 66 pixels.
; PLAN: r0=75(x), r1=83(y), r2=29(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 83
LDI r2, 29
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
