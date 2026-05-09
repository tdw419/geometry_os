; DESCRIPTION: Creates a cyan rectangular region at (157, 161) spanning 118 by 37 pixels.
; PLAN: r0=157(x), r1=161(y), r2=118(width), r3=37(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 161
LDI r2, 118
LDI r3, 37
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
