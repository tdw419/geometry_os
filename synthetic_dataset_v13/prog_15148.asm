; DESCRIPTION: Creates a cyan rectangular region at (266, 205) spanning 91 by 41 pixels.
; PLAN: r0=266(x), r1=205(y), r2=91(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 205
LDI r2, 91
LDI r3, 41
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
