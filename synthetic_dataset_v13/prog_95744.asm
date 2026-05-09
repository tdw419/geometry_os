; DESCRIPTION: Creates a cyan rectangular region at (14, 72) spanning 83 by 97 pixels.
; PLAN: r0=14(x), r1=72(y), r2=83(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 72
LDI r2, 83
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
