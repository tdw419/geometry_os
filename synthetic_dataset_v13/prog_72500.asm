; DESCRIPTION: Creates a cyan rectangular region at (24, 49) spanning 78 by 87 pixels.
; PLAN: r0=24(x), r1=49(y), r2=78(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 49
LDI r2, 78
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
