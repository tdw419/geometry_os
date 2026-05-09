; DESCRIPTION: Creates a cyan rectangular region at (218, 183) spanning 110 by 47 pixels.
; PLAN: r0=218(x), r1=183(y), r2=110(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 183
LDI r2, 110
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
