; DESCRIPTION: Creates a cyan rectangular region at (117, 66) spanning 83 by 58 pixels.
; PLAN: r0=117(x), r1=66(y), r2=83(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 66
LDI r2, 83
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
