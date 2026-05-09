; DESCRIPTION: Creates a cyan rectangular region at (334, 91) spanning 101 by 117 pixels.
; PLAN: r0=334(x), r1=91(y), r2=101(width), r3=117(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 91
LDI r2, 101
LDI r3, 117
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
