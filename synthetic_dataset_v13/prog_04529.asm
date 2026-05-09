; DESCRIPTION: Creates a cyan rectangular region at (31, 73) spanning 118 by 74 pixels.
; PLAN: r0=31(x), r1=73(y), r2=118(width), r3=74(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 73
LDI r2, 118
LDI r3, 74
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
