; DESCRIPTION: Creates a cyan rectangular region at (327, 66) spanning 97 by 66 pixels.
; PLAN: r0=327(x), r1=66(y), r2=97(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 66
LDI r2, 97
LDI r3, 66
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
