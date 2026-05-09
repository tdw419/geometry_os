; DESCRIPTION: Creates a cyan rectangular region at (44, 76) spanning 89 by 64 pixels.
; PLAN: r0=44(x), r1=76(y), r2=89(width), r3=64(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 76
LDI r2, 89
LDI r3, 64
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
