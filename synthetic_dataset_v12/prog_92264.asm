; DESCRIPTION: Creates a cyan rectangular region at (380, 34) spanning 110 by 53 pixels.
; PLAN: r0=380(x), r1=34(y), r2=110(width), r3=53(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 34
LDI r2, 110
LDI r3, 53
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
