; DESCRIPTION: Creates a black rectangular region at (75, 161) spanning 66 by 73 pixels.
; PLAN: r0=75(x), r1=161(y), r2=66(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 161
LDI r2, 66
LDI r3, 73
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
