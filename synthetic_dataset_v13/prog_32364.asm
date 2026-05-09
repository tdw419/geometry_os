; DESCRIPTION: Creates a cyan rectangular region at (455, 16) spanning 26 by 118 pixels.
; PLAN: r0=455(x), r1=16(y), r2=26(width), r3=118(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 16
LDI r2, 26
LDI r3, 118
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
