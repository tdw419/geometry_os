; DESCRIPTION: Creates a cyan rectangular region at (309, 22) spanning 99 by 75 pixels.
; PLAN: r0=309(x), r1=22(y), r2=99(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 22
LDI r2, 99
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
