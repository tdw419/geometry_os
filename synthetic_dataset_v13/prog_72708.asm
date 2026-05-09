; DESCRIPTION: Creates a cyan rectangular region at (13, 49) spanning 26 by 52 pixels.
; PLAN: r0=13(x), r1=49(y), r2=26(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 49
LDI r2, 26
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
