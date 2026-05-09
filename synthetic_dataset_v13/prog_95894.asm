; DESCRIPTION: Creates a cyan rectangular region at (162, 145) spanning 61 by 31 pixels.
; PLAN: r0=162(x), r1=145(y), r2=61(width), r3=31(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 145
LDI r2, 61
LDI r3, 31
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
