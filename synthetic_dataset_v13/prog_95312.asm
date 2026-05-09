; DESCRIPTION: Creates a cyan rectangular region at (163, 57) spanning 28 by 115 pixels.
; PLAN: r0=163(x), r1=57(y), r2=28(width), r3=115(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 57
LDI r2, 28
LDI r3, 115
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
