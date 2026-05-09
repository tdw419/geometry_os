; DESCRIPTION: Creates a cyan rectangular region at (64, 11) spanning 89 by 62 pixels.
; PLAN: r0=64(x), r1=11(y), r2=89(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 11
LDI r2, 89
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
