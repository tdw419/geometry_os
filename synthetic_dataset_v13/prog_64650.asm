; DESCRIPTION: Creates a cyan rectangular region at (139, 119) spanning 96 by 79 pixels.
; PLAN: r0=139(x), r1=119(y), r2=96(width), r3=79(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 119
LDI r2, 96
LDI r3, 79
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
