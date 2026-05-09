; DESCRIPTION: Creates a cyan rectangular region at (31, 119) spanning 73 by 38 pixels.
; PLAN: r0=31(x), r1=119(y), r2=73(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 119
LDI r2, 73
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
