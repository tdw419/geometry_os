; DESCRIPTION: Creates a cyan rectangular region at (319, 140) spanning 31 by 17 pixels.
; PLAN: r0=319(x), r1=140(y), r2=31(width), r3=17(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 140
LDI r2, 31
LDI r3, 17
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
