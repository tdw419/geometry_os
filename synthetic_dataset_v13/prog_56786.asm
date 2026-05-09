; DESCRIPTION: Creates a cyan rectangular region at (0, 118) spanning 45 by 49 pixels.
; PLAN: r0=0(x), r1=118(y), r2=45(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 118
LDI r2, 45
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
