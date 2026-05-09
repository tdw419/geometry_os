; DESCRIPTION: Creates a cyan rectangular region at (56, 117) spanning 57 by 110 pixels.
; PLAN: r0=56(x), r1=117(y), r2=57(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 117
LDI r2, 57
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
