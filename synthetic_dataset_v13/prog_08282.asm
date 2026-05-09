; DESCRIPTION: Creates a cyan rectangular region at (83, 157) spanning 25 by 57 pixels.
; PLAN: r0=83(x), r1=157(y), r2=25(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 157
LDI r2, 25
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
