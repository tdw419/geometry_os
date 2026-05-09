; DESCRIPTION: Creates a cyan rectangular region at (381, 75) spanning 54 by 101 pixels.
; PLAN: r0=381(x), r1=75(y), r2=54(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 75
LDI r2, 54
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
