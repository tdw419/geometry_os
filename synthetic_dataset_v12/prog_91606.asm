; DESCRIPTION: Creates a cyan rectangular region at (157, 149) spanning 115 by 25 pixels.
; PLAN: r0=157(x), r1=149(y), r2=115(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 149
LDI r2, 115
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
