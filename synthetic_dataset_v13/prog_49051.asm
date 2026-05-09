; DESCRIPTION: Creates a cyan rectangular region at (79, 106) spanning 118 by 119 pixels.
; PLAN: r0=79(x), r1=106(y), r2=118(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 106
LDI r2, 118
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
