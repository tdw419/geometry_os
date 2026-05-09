; DESCRIPTION: Creates a cyan rectangular region at (57, 65) spanning 114 by 11 pixels.
; PLAN: r0=57(x), r1=65(y), r2=114(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 65
LDI r2, 114
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
