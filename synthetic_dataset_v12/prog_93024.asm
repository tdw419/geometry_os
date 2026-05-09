; DESCRIPTION: Creates a cyan rectangular region at (380, 115) spanning 102 by 119 pixels.
; PLAN: r0=380(x), r1=115(y), r2=102(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 115
LDI r2, 102
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
