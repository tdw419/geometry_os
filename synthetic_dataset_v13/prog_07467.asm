; DESCRIPTION: Creates a cyan rectangular region at (51, 128) spanning 66 by 97 pixels.
; PLAN: r0=51(x), r1=128(y), r2=66(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 128
LDI r2, 66
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
