; DESCRIPTION: Creates a cyan rectangular region at (472, 100) spanning 37 by 97 pixels.
; PLAN: r0=472(x), r1=100(y), r2=37(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 100
LDI r2, 37
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
