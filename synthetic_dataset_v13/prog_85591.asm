; DESCRIPTION: Creates a cyan rectangular region at (306, 118) spanning 68 by 29 pixels.
; PLAN: r0=306(x), r1=118(y), r2=68(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 118
LDI r2, 68
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
