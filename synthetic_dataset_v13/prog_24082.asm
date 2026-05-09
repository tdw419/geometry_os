; DESCRIPTION: Creates a cyan rectangular region at (49, 101) spanning 97 by 107 pixels.
; PLAN: r0=49(x), r1=101(y), r2=97(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 101
LDI r2, 97
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
