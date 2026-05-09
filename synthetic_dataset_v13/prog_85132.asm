; DESCRIPTION: Creates a cyan rectangular region at (49, 0) spanning 55 by 14 pixels.
; PLAN: r0=49(x), r1=0(y), r2=55(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 0
LDI r2, 55
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
