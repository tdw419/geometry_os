; DESCRIPTION: Creates a cyan rectangular region at (348, 44) spanning 49 by 66 pixels.
; PLAN: r0=348(x), r1=44(y), r2=49(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 44
LDI r2, 49
LDI r3, 66
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
