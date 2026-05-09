; DESCRIPTION: Creates a cyan rectangular region at (139, 160) spanning 13 by 25 pixels.
; PLAN: r0=139(x), r1=160(y), r2=13(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 160
LDI r2, 13
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
