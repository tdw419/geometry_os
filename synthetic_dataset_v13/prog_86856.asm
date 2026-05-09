; DESCRIPTION: Creates a black rectangular region at (161, 57) spanning 66 by 68 pixels.
; PLAN: r0=161(x), r1=57(y), r2=66(width), r3=68(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 57
LDI r2, 66
LDI r3, 68
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
