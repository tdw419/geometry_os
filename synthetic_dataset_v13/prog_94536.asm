; DESCRIPTION: Creates a cyan rectangular region at (83, 26) spanning 11 by 25 pixels.
; PLAN: r0=83(x), r1=26(y), r2=11(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 26
LDI r2, 11
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
