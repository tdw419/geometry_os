; DESCRIPTION: Creates a cyan rectangular region at (73, 205) spanning 91 by 31 pixels.
; PLAN: r0=73(x), r1=205(y), r2=91(width), r3=31(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 205
LDI r2, 91
LDI r3, 31
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
