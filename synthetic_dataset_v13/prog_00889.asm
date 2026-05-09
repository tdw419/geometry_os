; DESCRIPTION: Creates a cyan rectangular region at (339, 26) spanning 29 by 97 pixels.
; PLAN: r0=339(x), r1=26(y), r2=29(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 26
LDI r2, 29
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
