; DESCRIPTION: Creates a cyan rectangular region at (106, 40) spanning 22 by 18 pixels.
; PLAN: r0=106(x), r1=40(y), r2=22(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 40
LDI r2, 22
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
