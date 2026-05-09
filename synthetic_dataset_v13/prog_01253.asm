; DESCRIPTION: Creates a cyan rectangular region at (455, 106) spanning 11 by 78 pixels.
; PLAN: r0=455(x), r1=106(y), r2=11(width), r3=78(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 106
LDI r2, 11
LDI r3, 78
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
