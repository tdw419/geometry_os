; DESCRIPTION: Creates a cyan rectangular region at (321, 114) spanning 115 by 97 pixels.
; PLAN: r0=321(x), r1=114(y), r2=115(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 114
LDI r2, 115
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
