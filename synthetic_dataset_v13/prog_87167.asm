; DESCRIPTION: Creates a cyan rectangular region at (319, 21) spanning 25 by 57 pixels.
; PLAN: r0=319(x), r1=21(y), r2=25(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 21
LDI r2, 25
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
