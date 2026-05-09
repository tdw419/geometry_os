; DESCRIPTION: Creates a cyan rectangular region at (56, 153) spanning 97 by 77 pixels.
; PLAN: r0=56(x), r1=153(y), r2=97(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 153
LDI r2, 97
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
