; DESCRIPTION: Creates a cyan rectangular region at (252, 2) spanning 23 by 115 pixels.
; PLAN: r0=252(x), r1=2(y), r2=23(width), r3=115(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 2
LDI r2, 23
LDI r3, 115
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
