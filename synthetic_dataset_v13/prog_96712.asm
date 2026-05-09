; DESCRIPTION: Creates a cyan rectangular region at (11, 12) spanning 23 by 13 pixels.
; PLAN: r0=11(x), r1=12(y), r2=23(width), r3=13(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 12
LDI r2, 23
LDI r3, 13
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
