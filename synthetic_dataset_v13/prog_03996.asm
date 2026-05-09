; DESCRIPTION: Creates a cyan rectangular region at (98, 179) spanning 57 by 28 pixels.
; PLAN: r0=98(x), r1=179(y), r2=57(width), r3=28(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 179
LDI r2, 57
LDI r3, 28
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
