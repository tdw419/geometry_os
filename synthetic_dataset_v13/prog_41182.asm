; DESCRIPTION: Creates a cyan rectangular region at (145, 190) spanning 97 by 28 pixels.
; PLAN: r0=145(x), r1=190(y), r2=97(width), r3=28(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 190
LDI r2, 97
LDI r3, 28
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
