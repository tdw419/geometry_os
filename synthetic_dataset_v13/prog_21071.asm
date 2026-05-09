; DESCRIPTION: Creates a cyan rectangular region at (344, 0) spanning 46 by 117 pixels.
; PLAN: r0=344(x), r1=0(y), r2=46(width), r3=117(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 0
LDI r2, 46
LDI r3, 117
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
