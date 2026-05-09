; DESCRIPTION: Creates a cyan rectangular region at (56, 49) spanning 78 by 97 pixels.
; PLAN: r0=56(x), r1=49(y), r2=78(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 49
LDI r2, 78
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
