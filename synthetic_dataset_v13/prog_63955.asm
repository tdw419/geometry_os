; DESCRIPTION: Creates a cyan rectangular region at (151, 91) spanning 23 by 106 pixels.
; PLAN: r0=151(x), r1=91(y), r2=23(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 91
LDI r2, 23
LDI r3, 106
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
