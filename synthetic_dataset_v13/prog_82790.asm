; DESCRIPTION: Creates a cyan rectangular region at (250, 84) spanning 91 by 44 pixels.
; PLAN: r0=250(x), r1=84(y), r2=91(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 84
LDI r2, 91
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
