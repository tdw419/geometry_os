; DESCRIPTION: Creates a cyan rectangular region at (427, 141) spanning 38 by 58 pixels.
; PLAN: r0=427(x), r1=141(y), r2=38(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 141
LDI r2, 38
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
