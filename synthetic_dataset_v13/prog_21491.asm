; DESCRIPTION: Creates a cyan rectangular region at (339, 118) spanning 72 by 110 pixels.
; PLAN: r0=339(x), r1=118(y), r2=72(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 118
LDI r2, 72
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
