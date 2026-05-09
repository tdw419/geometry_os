; DESCRIPTION: Creates a black rectangular region at (410, 66) spanning 102 by 49 pixels.
; PLAN: r0=410(x), r1=66(y), r2=102(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 66
LDI r2, 102
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
