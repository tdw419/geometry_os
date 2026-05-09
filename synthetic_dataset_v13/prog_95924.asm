; DESCRIPTION: Creates a cyan rectangular region at (427, 115) spanning 11 by 61 pixels.
; PLAN: r0=427(x), r1=115(y), r2=11(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 115
LDI r2, 11
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
