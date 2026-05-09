; DESCRIPTION: Creates a cyan rectangular region at (229, 145) spanning 91 by 25 pixels.
; PLAN: r0=229(x), r1=145(y), r2=91(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 145
LDI r2, 91
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
