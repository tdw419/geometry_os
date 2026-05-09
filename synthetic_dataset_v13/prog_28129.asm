; DESCRIPTION: Creates a cyan rectangular region at (28, 11) spanning 45 by 97 pixels.
; PLAN: r0=28(x), r1=11(y), r2=45(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 11
LDI r2, 45
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
