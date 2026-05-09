; DESCRIPTION: Creates a cyan rectangular region at (162, 82) spanning 105 by 119 pixels.
; PLAN: r0=162(x), r1=82(y), r2=105(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 82
LDI r2, 105
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
