; DESCRIPTION: Creates a cyan rectangular region at (272, 170) spanning 47 by 83 pixels.
; PLAN: r0=272(x), r1=170(y), r2=47(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 170
LDI r2, 47
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
