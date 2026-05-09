; DESCRIPTION: Creates a cyan rectangular region at (97, 3) spanning 15 by 68 pixels.
; PLAN: r0=97(x), r1=3(y), r2=15(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 3
LDI r2, 15
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
