; DESCRIPTION: Creates a yellow rectangular region at (187, 119) spanning 98 by 66 pixels.
; PLAN: r0=187(x), r1=119(y), r2=98(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 119
LDI r2, 98
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
