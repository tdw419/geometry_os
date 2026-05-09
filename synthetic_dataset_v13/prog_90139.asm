; DESCRIPTION: Creates a cyan rectangular region at (244, 19) spanning 115 by 85 pixels.
; PLAN: r0=244(x), r1=19(y), r2=115(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 19
LDI r2, 115
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
