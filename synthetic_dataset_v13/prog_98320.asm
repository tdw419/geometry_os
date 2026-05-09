; DESCRIPTION: Creates a cyan rectangular region at (119, 153) spanning 79 by 26 pixels.
; PLAN: r0=119(x), r1=153(y), r2=79(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 153
LDI r2, 79
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
