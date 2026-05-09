; DESCRIPTION: Creates a cyan rectangular region at (335, 9) spanning 73 by 61 pixels.
; PLAN: r0=335(x), r1=9(y), r2=73(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 9
LDI r2, 73
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
