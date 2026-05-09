; DESCRIPTION: Creates a cyan rectangular region at (38, 91) spanning 56 by 52 pixels.
; PLAN: r0=38(x), r1=91(y), r2=56(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 91
LDI r2, 56
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
