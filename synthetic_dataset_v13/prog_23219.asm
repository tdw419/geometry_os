; DESCRIPTION: Creates a cyan rectangular region at (79, 99) spanning 110 by 38 pixels.
; PLAN: r0=79(x), r1=99(y), r2=110(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 99
LDI r2, 110
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
