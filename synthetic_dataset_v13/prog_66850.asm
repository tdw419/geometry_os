; DESCRIPTION: Creates a cyan rectangular region at (306, 201) spanning 97 by 19 pixels.
; PLAN: r0=306(x), r1=201(y), r2=97(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 201
LDI r2, 97
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
