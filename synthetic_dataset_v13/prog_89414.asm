; DESCRIPTION: Creates a cyan rectangular region at (334, 87) spanning 57 by 54 pixels.
; PLAN: r0=334(x), r1=87(y), r2=57(width), r3=54(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 87
LDI r2, 57
LDI r3, 54
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
