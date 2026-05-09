; DESCRIPTION: Creates a cyan rectangular region at (47, 188) spanning 101 by 13 pixels.
; PLAN: r0=47(x), r1=188(y), r2=101(width), r3=13(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 188
LDI r2, 101
LDI r3, 13
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
