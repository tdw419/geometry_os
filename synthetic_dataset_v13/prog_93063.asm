; DESCRIPTION: Creates a cyan rectangular region at (0, 102) spanning 83 by 88 pixels.
; PLAN: r0=0(x), r1=102(y), r2=83(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 102
LDI r2, 83
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
