; DESCRIPTION: Creates a cyan rectangular region at (76, 62) spanning 55 by 119 pixels.
; PLAN: r0=76(x), r1=62(y), r2=55(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 62
LDI r2, 55
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
