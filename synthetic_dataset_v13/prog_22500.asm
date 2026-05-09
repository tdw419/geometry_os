; DESCRIPTION: Creates a cyan rectangular region at (188, 46) spanning 75 by 91 pixels.
; PLAN: r0=188(x), r1=46(y), r2=75(width), r3=91(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 46
LDI r2, 75
LDI r3, 91
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
