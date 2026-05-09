; DESCRIPTION: Creates a cyan rectangular region at (373, 80) spanning 97 by 15 pixels.
; PLAN: r0=373(x), r1=80(y), r2=97(width), r3=15(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 80
LDI r2, 97
LDI r3, 15
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
