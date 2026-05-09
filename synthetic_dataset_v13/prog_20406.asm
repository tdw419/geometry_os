; DESCRIPTION: Creates a cyan rectangular region at (172, 15) spanning 110 by 72 pixels.
; PLAN: r0=172(x), r1=15(y), r2=110(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 15
LDI r2, 110
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
