; DESCRIPTION: Creates a cyan rectangular region at (276, 61) spanning 28 by 78 pixels.
; PLAN: r0=276(x), r1=61(y), r2=28(width), r3=78(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 61
LDI r2, 28
LDI r3, 78
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
