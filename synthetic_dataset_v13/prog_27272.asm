; DESCRIPTION: Creates a cyan rectangular region at (172, 162) spanning 46 by 66 pixels.
; PLAN: r0=172(x), r1=162(y), r2=46(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 162
LDI r2, 46
LDI r3, 66
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
