; DESCRIPTION: Creates a yellow rectangular region at (334, 46) spanning 49 by 66 pixels.
; PLAN: r0=334(x), r1=46(y), r2=49(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 46
LDI r2, 49
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
