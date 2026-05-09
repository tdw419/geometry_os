; DESCRIPTION: Creates a cyan rectangular region at (250, 56) spanning 77 by 118 pixels.
; PLAN: r0=250(x), r1=56(y), r2=77(width), r3=118(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 56
LDI r2, 77
LDI r3, 118
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
