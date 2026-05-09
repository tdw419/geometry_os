; DESCRIPTION: Creates a cyan rectangular region at (364, 57) spanning 71 by 78 pixels.
; PLAN: r0=364(x), r1=57(y), r2=71(width), r3=78(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 57
LDI r2, 71
LDI r3, 78
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
