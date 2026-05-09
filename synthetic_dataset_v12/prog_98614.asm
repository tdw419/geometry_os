; DESCRIPTION: Creates a cyan rectangular region at (393, 156) spanning 105 by 97 pixels.
; PLAN: r0=393(x), r1=156(y), r2=105(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 156
LDI r2, 105
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
