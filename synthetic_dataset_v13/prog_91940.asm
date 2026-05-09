; DESCRIPTION: Creates a cyan rectangular region at (455, 122) spanning 23 by 15 pixels.
; PLAN: r0=455(x), r1=122(y), r2=23(width), r3=15(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 122
LDI r2, 23
LDI r3, 15
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
