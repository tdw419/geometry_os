; DESCRIPTION: Creates a cyan rectangular region at (143, 75) spanning 118 by 33 pixels.
; PLAN: r0=143(x), r1=75(y), r2=118(width), r3=33(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 75
LDI r2, 118
LDI r3, 33
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
