; DESCRIPTION: Creates a cyan rectangular region at (7, 91) spanning 100 by 18 pixels.
; PLAN: r0=7(x), r1=91(y), r2=100(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 91
LDI r2, 100
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
