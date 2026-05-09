; DESCRIPTION: Creates a cyan rectangular region at (169, 232) spanning 118 by 20 pixels.
; PLAN: r0=169(x), r1=232(y), r2=118(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 232
LDI r2, 118
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
