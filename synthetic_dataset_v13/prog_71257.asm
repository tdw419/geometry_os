; DESCRIPTION: Creates a cyan rectangular region at (319, 179) spanning 29 by 73 pixels.
; PLAN: r0=319(x), r1=179(y), r2=29(width), r3=73(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 179
LDI r2, 29
LDI r3, 73
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
