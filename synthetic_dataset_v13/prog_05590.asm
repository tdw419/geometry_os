; DESCRIPTION: Creates a cyan rectangular region at (334, 68) spanning 89 by 107 pixels.
; PLAN: r0=334(x), r1=68(y), r2=89(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 68
LDI r2, 89
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
