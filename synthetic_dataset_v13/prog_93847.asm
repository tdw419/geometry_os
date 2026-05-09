; DESCRIPTION: Creates a cyan rectangular region at (426, 137) spanning 76 by 105 pixels.
; PLAN: r0=426(x), r1=137(y), r2=76(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 137
LDI r2, 76
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
