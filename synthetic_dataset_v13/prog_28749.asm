; DESCRIPTION: Creates a cyan rectangular region at (351, 7) spanning 118 by 44 pixels.
; PLAN: r0=351(x), r1=7(y), r2=118(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 7
LDI r2, 118
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
